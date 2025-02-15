#!/bin/bash

# Set the source directory (where your .proto files are located)
PROTO_DIR="./"

# Set the output directory (where the generated Go files will be stored)
OUTPUT_DIR="../server/"

# Find all subdirectories inside the proto directory
for dir in $(find "$PROTO_DIR" -maxdepth 1 -type d ! -path "$PROTO_DIR"); do
    echo "Compiling Protobuf files in $dir..."
    protoc --twirp_out="$OUTPUT_DIR" --go_out="$OUTPUT_DIR" "$dir"/*.proto
done

echo "✅ Protobuf compilation completed!"

