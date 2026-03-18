package models

import "time"

// LoginRequest defines the payload for logging in.
type LoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

// RegisterRequest defines the payload for user registration.
type RegisterRequest struct {
	Email       string `json:"email"`
	Password    string `json:"password"`
	UserName    string `json:"user_name"`
	FirstName   string `json:"first_name,omitempty"`
	LastName    string `json:"last_name,omitempty"`
	PhoneNumber string `json:"phone_number,omitempty"`
	BusinessID  string `json:"business_id,omitempty"`
	StoreID     string `json:"store_id,omitempty"`
}

// RefreshRequest defines the payload for refreshing a token.
type RefreshRequest struct {
	RefreshToken string `json:"refresh_token"`
}

// AuthResponse represents the response containing tokens and user data.
type AuthResponse struct {
	AccessToken  string `json:"access_token"`
	RefreshToken string `json:"refresh_token"`
	TokenType    string `json:"token_type"`
	ExpiresIn    int64  `json:"expires_in"`
	User         *User  `json:"user"`
}

// ErrorResponse represents an API error response.
type ErrorResponse struct {
	Code    string `json:"code"`
	Message string `json:"message"`
}

// User represents the authenticated user details.
type User struct {
	RefID         string    `json:"ref_id"`
	UserName      string    `json:"user_name"`
	Email         string    `json:"email"`
	FirstName     string    `json:"first_name"`
	LastName      string    `json:"last_name"`
	PhoneNumber   string    `json:"phone_number"`
	AccountStatus string    `json:"account_status"`
	CreatedAt     time.Time `json:"created_at"`
}

// UploadRequest represents a sync upload request.
type UploadRequest struct {
	Operations []UploadOperation `json:"operations"`
}

// UploadOperation represents a single CRUD operation.
type UploadOperation struct {
	Op    string                 `json:"op"`
	Table string                 `json:"table"`
	ID    string                 `json:"id"`
	Data  map[string]interface{} `json:"data"`
}
