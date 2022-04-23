#!/bin/bash

COMMENT=$(ojichat $NAME)
echo $COMMENT
echo $WEB_HOOK_URL
curl -X POST --data-urlencode "payload={\"channel\": \"#ojichat-mine\", \"username\": \"Ojichat\", \"text\": \"$COMMENT\", \"icon_emoji\": \":ojichat:\"}" $WEB_HOOK_URL