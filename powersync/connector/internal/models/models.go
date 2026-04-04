package models

// ErrorResponse represents an API error response.
type ErrorResponse struct {
	Code    string `json:"code"`
	Message string `json:"message"`
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
