#!/bin/bash
set -e

# Clean temporary files.
rm -f /tmp/buf-gen-*

# Remove old generated files.
rm -rf gen/dart/lib/src
rm -rf gen/go/rpc

# Generate the protos
buf generate

# Merge generated OpenAPI specs.
find gen/openapi/specs -type f -name "*.yaml" -print0 \
| sort -z \
| xargs -0 yq eval-all '. as $item ireduce ({}; . * $item )' \
> gen/openapi/openapi.merged.yaml

# Add Dart pubspec.yaml file.
cd gen/dart
cat <<EOF > pubspec.yaml
name: sabitou_rpc
description: The sabitou dart rpc client.
repository: https://github.com/karibu-cap/sabitou

version: 1.0.0+1

environment:
  sdk: ^3.5.3

dependencies:
  connectrpc: ^0.3.0

dev_dependencies:

EOF

dart pub get
cd -

# Add Go mod file.
cd gen/go
cat <<EOF > go.mod
module github.com/karibu-cap/sabitou/protos/gen/go

go 1.24.0

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.36.5-20250219170025-d39267d9df8f.1
	connectrpc.com/connect v1.18.1
	google.golang.org/protobuf v1.36.5
)

EOF

go mod tidy
cd -
