#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")"

gh act -s GITHIB_TOKEN=$(gh auth token) repository_dispatch
