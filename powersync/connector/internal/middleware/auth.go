package middleware

import (
	"context"
	"encoding/json"
	"net/http"
	"strings"

	"github.com/sabitou/powersync/connector/internal/auth"
	"github.com/sabitou/powersync/connector/internal/models"
)

// contextKey is an unexported type used for context keys in this package.
type contextKey string

const claimsKey contextKey = "claims"

// AuthMiddleware validates the JWT Bearer token on incoming requests.
type AuthMiddleware struct {
	jwtService *auth.JWTService
}

// NewAuthMiddleware creates a new AuthMiddleware.
func NewAuthMiddleware(jwtService *auth.JWTService) *AuthMiddleware {
	return &AuthMiddleware{jwtService: jwtService}
}

// Wrap returns an http.Handler that validates the JWT before delegating.
func (m *AuthMiddleware) Wrap(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		header := r.Header.Get("Authorization")
		if header == "" || !strings.HasPrefix(header, "Bearer ") {
			writeUnauthorized(w, "MISSING_TOKEN", "authorization header required")
			return
		}

		tokenStr := strings.TrimPrefix(header, "Bearer ")
		claims, err := m.jwtService.ValidateClaims(tokenStr)
		if err != nil {
			writeUnauthorized(w, "INVALID_TOKEN", "token is invalid or expired")
			return
		}

		ctx := context.WithValue(r.Context(), auth.ClaimsContextKey, claims)
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}

func writeUnauthorized(w http.ResponseWriter, code, message string) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusUnauthorized)
	json.NewEncoder(w).Encode(models.ErrorResponse{Code: code, Message: message}) //nolint:errcheck
}