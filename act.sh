#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")"

gh act -s GITHUB_TOKEN=$(gh auth token) workflow_dispatch
