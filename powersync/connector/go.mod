module github.com/sabitou/powersync/connector

go 1.24.0

require (
	connectrpc.com/connect v1.18.1
	github.com/golang-jwt/jwt/v5 v5.2.1
	github.com/jackc/pgx/v5 v5.5.5
	github.com/karibu-cap/sabitou/protos/gen/go v0.0.0-20260312141930-68067e38a2dd
	golang.org/x/crypto v0.22.0
)

replace github.com/karibu-cap/sabitou/protos/gen/go => ../../protos/gen/go
