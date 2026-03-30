module github.com/sabitou/powersync/connector

go 1.24.0

require (
	connectrpc.com/connect v1.18.1
	github.com/golang-jwt/jwt/v5 v5.2.1
	github.com/jackc/pgx/v5 v5.5.5
	github.com/karibu-cap/sabitou/protos/gen/go v0.0.0-20260312141930-68067e38a2dd
	golang.org/x/crypto v0.22.0
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.36.5-20250219170025-d39267d9df8f.1 // indirect
	github.com/jackc/pgpassfile v1.0.0 // indirect
	github.com/jackc/pgservicefile v0.0.0-20221227161230-091c0ba34f0a // indirect
	github.com/jackc/puddle/v2 v2.2.1 // indirect
	golang.org/x/sync v0.1.0 // indirect
	golang.org/x/text v0.14.0 // indirect
	google.golang.org/protobuf v1.36.5 // indirect
)

replace github.com/karibu-cap/sabitou/protos/gen/go => ../../protos/gen/go
