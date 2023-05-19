#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")"

git status -s | sed -nr "/^(A|M| M)/p" | awk '{print $2}' | xargs -i git add {}
git commit -m "configure workflows"

date > fix
git commit -m "fix: automatic" fix

git pull --rebase
git push

GITHUB_TOKEN=$(gh auth token)
curl -fsSL -H "Accept: application/vnd.github.everest-preview+json" -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/repos/momiji/gh-workflows/dispatches -d '{ "event_type": "manual-semantic" }'
