#!/usr/bin/env bash

set -euo pipefail

if ! command -v "$1" &> /dev/null; then
  echo "$1 not detected"
  exit 1
fi
