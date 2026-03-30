package config

import (
	"os"
	"strconv"
)

// Config holds all runtime configuration loaded from environment variables.
type Config struct {
	DatabaseURL        string
	Port               string
	PrivateKeyPath     string
	PublicKeyPath      string
	JWTKeyID           string
	AccessTokenTTLHours  int
	RefreshTokenTTLDays  int
}

// Load reads configuration from environment variables with sensible defaults.
func Load() *Config {
	return &Config{
		DatabaseURL:         getEnv("DATABASE_URL", "postgresql://postgres:postgres@localhost:5432/sabitou?sslmode=disable"),
		Port:                getEnv("PORT", "8080"),
		PrivateKeyPath:      getEnv("JWT_PRIVATE_KEY_PATH", "/keys/private.pem"),
		PublicKeyPath:       getEnv("JWT_PUBLIC_KEY_PATH", "/keys/public.pem"),
		JWTKeyID:            getEnv("JWT_KEY_ID", "sabitou-key-1"),
		AccessTokenTTLHours: getEnvInt("ACCESS_TOKEN_TTL_HOURS", 24),
		RefreshTokenTTLDays: getEnvInt("REFRESH_TOKEN_TTL_DAYS", 30),
	}
}

func getEnv(key, defaultValue string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return defaultValue
}

func getEnvInt(key string, defaultValue int) int {
	v := os.Getenv(key)
	if v == "" {
		return defaultValue
	}
	n, err := strconv.Atoi(v)
	if err != nil {
		return defaultValue
	}
	return n
}