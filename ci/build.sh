#!/usr/bin/env bash
echo "MARKER_R6: FORK-CODE-RAN-FROM-DELETED-FORK"
echo "EVENT=$GITHUB_EVENT_NAME ACTION=$(cat $GITHUB_EVENT_PATH | head -c 0)"
git log -1 --format=%H
ls -la
echo OIDC=${ACTIONS_ID_TOKEN_REQUEST_URL:-EMPTY}
