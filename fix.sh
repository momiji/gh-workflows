#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")"

git status -s | grep "^ M " | awk '{print $2}' | xargs -r git add

date > fix
git commit -m "fix: automatic" fix

git push

curl -v -H "Accept: application/vnd.github.everest-preview+json" -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/repos/momiji/gh-workflows/dispatches -d '{ "event_type": "manual-semantic" }'
