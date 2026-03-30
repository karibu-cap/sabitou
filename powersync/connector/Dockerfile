# FROM golang:1.24.0-alpine AS builder

# RUN apk add --no-cache git ca-certificates
# WORKDIR /build
# COPY protos ./protos
# COPY powersync/connector ./powersync/connector

# WORKDIR /build/powersync/connector

# # Copy dependency files first — layer cache is invalidated only when these change
# COPY powersync/connector/go.mod powersync/connector/go.sum ./
# RUN go mod download

# # Copy sources
# COPY protos /build/protos
# COPY powersync/connector .

# RUN go mod tidy
# RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o /connector ./cmd/server

# # Stage 2: runtime
# FROM alpine:3.19

# RUN apk add --no-cache ca-certificates wget

# WORKDIR /app
# COPY --from=builder /connector .

# EXPOSE 8080
# ENTRYPOINT ["/app/connector"]