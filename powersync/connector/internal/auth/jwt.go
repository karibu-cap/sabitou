package auth

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/base64"
	"encoding/json"
	"encoding/pem"
	"fmt"
	"math/big"
	"net/http"
	"os"
	"path/filepath"
	"time"

	"github.com/golang-jwt/jwt/v5"
)

// Claims holds the custom JWT payload for the Sabitou platform.
//
// PowerSync reads these claims in sync_rules.yml via:
//   - request.user_id()  → sub
//   - request.jwt() ->> 'store_id'    → store_id
//   - request.jwt() ->> 'business_id' → business_id
//
// All three values are ref_id values (the canonical app-level PKs),
// never the internal PostgreSQL UUID `id` column.
type Claims struct {
	// UserID mirrors the JWT `sub` claim — equals users.ref_id.
	UserID string `json:"user_id"`

	jwt.RegisteredClaims
}

// JWTService manages RS256 key pair lifecycle, token signing and JWKS serving.
type JWTService struct {
	privateKey      *rsa.PrivateKey
	keyID           string
	accessTokenTTL  time.Duration
	refreshTokenTTL time.Duration
}

// NewJWTService initialises the JWT service. It loads the key pair from disk,
// generating a new one if the key files do not yet exist.
func NewJWTService(privateKeyPath, publicKeyPath, keyID string, accessTTLHours, refreshTTLDays int) (*JWTService, error) {
	privateKey, err := loadOrGenerateKeyPair(privateKeyPath, publicKeyPath)
	if err != nil {
		return nil, fmt.Errorf("key pair initialisation: %w", err)
	}

	return &JWTService{
		privateKey:      privateKey,
		keyID:           keyID,
		accessTokenTTL:  time.Duration(accessTTLHours) * time.Hour,
		refreshTokenTTL: time.Duration(refreshTTLDays) * 24 * time.Hour,
	}, nil
}

// IssueAccessToken creates a signed RS256 JWT for the given user.
//
// Parameters:
//   - userID     — users.ref_id  (becomes JWT `sub` and `user_id`)
func (s *JWTService) IssueAccessToken(userID string) (string, time.Time, error) {
	expiry := time.Now().Add(s.accessTokenTTL)

	claims := Claims{
		UserID:     userID,
		RegisteredClaims: jwt.RegisteredClaims{
			Subject:   userID,
			IssuedAt:  jwt.NewNumericDate(time.Now()),
			ExpiresAt: jwt.NewNumericDate(expiry),
			Issuer:    "sabitou-connector",
			Audience:  jwt.ClaimStrings{"powersync"},
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodRS256, claims)
	token.Header["kid"] = s.keyID

	signed, err := token.SignedString(s.privateKey)
	if err != nil {
		return "", time.Time{}, fmt.Errorf("sign access token: %w", err)
	}

	return signed, expiry, nil
}

// ValidateClaims parses and validates an access token, returning its claims.
func (s *JWTService) ValidateClaims(tokenString string) (*Claims, error) {
	token, err := jwt.ParseWithClaims(tokenString, &Claims{}, func(t *jwt.Token) (interface{}, error) {
		if _, ok := t.Method.(*jwt.SigningMethodRSA); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", t.Header["alg"])
		}
		return &s.privateKey.PublicKey, nil
	})
	if err != nil {
		return nil, err
	}

	claims, ok := token.Claims.(*Claims)
	if !ok || !token.Valid {
		return nil, fmt.Errorf("invalid token")
	}

	return claims, nil
}

// AccessTokenTTL returns the configured access token duration.
func (s *JWTService) AccessTokenTTL() time.Duration { return s.accessTokenTTL }

// RefreshTokenTTL returns the configured refresh token duration.
func (s *JWTService) RefreshTokenTTL() time.Duration { return s.refreshTokenTTL }

// JWKSHandler serves the JSON Web Key Set, which PowerSync uses to validate
// client JWTs without calling the connector on every request.
func (s *JWTService) JWKSHandler(w http.ResponseWriter, r *http.Request) {
	pub := &s.privateKey.PublicKey

	// Encode modulus and exponent as base64url (no padding), per RFC 7517.
	nBytes := pub.N.Bytes()
	eBytes := big.NewInt(int64(pub.E)).Bytes()

	jwk := map[string]interface{}{
		"kty": "RSA",
		"use": "sig",
		"alg": "RS256",
		"kid": s.keyID,
		"n":   base64.RawURLEncoding.EncodeToString(nBytes),
		"e":   base64.RawURLEncoding.EncodeToString(eBytes),
	}

	payload, _ := json.Marshal(map[string]interface{}{"keys": []interface{}{jwk}})

	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Cache-Control", "public, max-age=300")
	w.Write(payload) //nolint:errcheck
}

// =============================================================================
// Key pair persistence
// =============================================================================

func loadOrGenerateKeyPair(privatePath, publicPath string) (*rsa.PrivateKey, error) {
	// Ensure the key directory exists.
	if err := os.MkdirAll(filepath.Dir(privatePath), 0o700); err != nil {
		return nil, fmt.Errorf("create key dir: %w", err)
	}

	// Try to load an existing private key.
	if data, err := os.ReadFile(privatePath); err == nil {
		block, _ := pem.Decode(data)
		if block != nil {
			key, parseErr := x509.ParsePKCS1PrivateKey(block.Bytes)
			if parseErr == nil {
				return key, nil
			}
		}
	}

	// Generate a new 2048-bit RSA key pair.
	privateKey, err := rsa.GenerateKey(rand.Reader, 2048)
	if err != nil {
		return nil, fmt.Errorf("generate rsa key: %w", err)
	}

	// Persist private key.
	privateBytes := x509.MarshalPKCS1PrivateKey(privateKey)
	privatePEM := pem.EncodeToMemory(&pem.Block{Type: "RSA PRIVATE KEY", Bytes: privateBytes})
	if err := os.WriteFile(privatePath, privatePEM, 0o600); err != nil {
		return nil, fmt.Errorf("write private key: %w", err)
	}

	// Persist public key.
	publicBytes, err := x509.MarshalPKIXPublicKey(&privateKey.PublicKey)
	if err != nil {
		return nil, fmt.Errorf("marshal public key: %w", err)
	}
	publicPEM := pem.EncodeToMemory(&pem.Block{Type: "PUBLIC KEY", Bytes: publicBytes})
	if err := os.WriteFile(publicPath, publicPEM, 0o644); err != nil {
		return nil, fmt.Errorf("write public key: %w", err)
	}

	return privateKey, nil
}
