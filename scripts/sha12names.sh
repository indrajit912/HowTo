#!/bin/bash
# This script prints the first 12 characters of the SHA256 hash of each .pgp file in the current directory

for file in *.pgp; do
  # Compute and print hash12 of filename
  hash=$(echo -n "$file" | sha256sum | cut -c1-12)
  echo "$file -> $hash"
done

