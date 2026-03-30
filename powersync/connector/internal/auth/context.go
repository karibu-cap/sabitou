package auth

import "context"

// contextKey is unexported to prevent collisions with other packages.
type contextKey string

// ClaimsContextKey is the key used to store Claims in a request context.
const ClaimsContextKey contextKey = "claims"

// ClaimsFromContext retrieves the validated JWT claims from the request context.
func ClaimsFromContext(ctx context.Context) (*Claims, bool) {
	claims, ok := ctx.Value(ClaimsContextKey).(*Claims)
	return claims, ok
}