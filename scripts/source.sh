#!/usr/bin/env bash

PROJECT_DIR=$(cd -- "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && cd .. && pwd)
SCRIPT_DIR="$PROJECT_DIR/scripts"

export PROJECT_DIR
export SCRIPT_DIR
