#!/bin/sh

WEBHOOK_URL=$1
TITLE=$2
COLOR=$3

generate_post_data()
{
  cat <<EOF
{
  "icon": "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
  "activity": "$GITHUB_WORKFLOW in $GITHUB_REPOSITORY",
  "attachments" :
  [{
    "title": "$TITLE",
    "color" : "$COLOR",
    "fields" : [
      {
        "title": "Author",
        "value": "$GITHUB_ACTOR",
        "short": true
      },
      {
        "title": "Repository",
        "value": "$GITHUB_REPOSITORY",
        "short": true
      },
      {
        "title": "Run ID",
        "value": "[$GITHUB_RUN_ID](https://github.com/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID)",
        "short": true
      },
      {
        "title": "Event",
        "value": "$GITHUB_EVENT_NAME",
        "short": true
      }
    ]
  }]
}
EOF
}

curl -X POST \
-H "Content-Type: application/json" \
--data "$(generate_post_data)" \
$WEBHOOK_URL
