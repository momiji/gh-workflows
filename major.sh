#!/bin/bash
set -Eeuo pipefail

git status -s | sed -nr "/^(A|M| M)/p" | awk '{print $2}' | xargs -i git add {}
git commit -m "configure workflows" ||:

date > fix
git add fix
git commit -m $'feat: automatic\n\nBREAKING CHANGE: new something'

git pull --rebase
git push

gh workflow run --ref $( git branch --show-current )

#GITHUB_TOKEN=$(gh auth token)
#curl -fsSL -H "Accept: application/vnd.github.everest-preview+json" -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/repos/momiji/gh-workflows/dispatches -d '{ "event_type": "manual-semantic" }'
