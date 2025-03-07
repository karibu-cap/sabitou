#!/bin/bash
set -e

# Clean temporary files.
rm -f /tmp/buf-gen-*

# save previous lock files to tmp dir only if they exist
[ -f "gen/go/go.sum" ] && mv gen/go/go.sum /tmp/buf-gen-go.sum
[ -f "gen/go/go.mod" ] && mv gen/go/go.mod /tmp/buf-gen-go.mod
[ -f "gen/dart/pubspec.lock" ] && mv gen/dart/pubspec.lock /tmp/buf-gen-dart.pubspec.lock
[ -f "gen/dart/pubspec.yaml" ] && mv gen/dart/pubspec.yaml /tmp/buf-gen-dart.pubspec.yaml

# Remove old generated files.
rm -rf gen

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

# Restore previous lock files.
[ -f "/tmp/buf-gen-dart.pubspec.lock" ] && mv /tmp/buf-gen-dart.pubspec.lock ./pubspec.lock
[ -f "/tmp/buf-gen-dart.pubspec.yaml" ] && mv /tmp/buf-gen-dart.pubspec.yaml ./pubspec.yaml

dart pub get
cd -

# Add Go mod file.
cd gen/go
cat <<EOF > go.mod
module github.com/karibu-cap/sabitou/protos/gen/go

go 1.24.0

EOF

# Restore previous lock files.
[ -f "/tmp/buf-gen-go.sum" ] && mv /tmp/buf-gen-go.sum ./go.sum
[ -f "/tmp/buf-gen-go.mod" ] && mv /tmp/buf-gen-go.mod ./go.mod

go mod tidy
cd -
