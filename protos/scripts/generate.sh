#!/bin/bash
set -e

# Generate the protos
buf generate

# Merge generated OpenAPI specs.
find gen/openapi/specs -type f -name "*.yaml" -print0 \
| xargs -0 yq eval-all '. as $item ireduce ([]; . + $item )' \
> gen/openapi/openapi.merged.yaml
