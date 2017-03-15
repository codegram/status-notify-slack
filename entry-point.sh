#!/bin/sh

status_url=$STATUS_URL
status_timeout=$STATUS_TIMEOUT
notify_timeout=$NOTIFY_TIMEOUT
channel=$SLACK_CHANNEL
username=$SLACK_USERNAME
text=$SLACK_NOTIFICATION_TEXT
icon=$SLACK_NOTIFICATION_ICON
webhook_url=$SLACK_NOTIFICATION_WEBHOOK_URL

while :
do
  curl -s -o /dev/null -w "%{http_code}" $status_url

  if [ $? -eq "200" ]
  then
    echo "Application works."
    sleep $status_timeout
  else
    echo "Application is not working."
    curl -X POST --data-urlencode "payload={\"channel\": \"$channel\", \"username\": \"$username\", \"text\": \"$text\", \"icon_emoji\": \"$icon\"}" $webhook_url
    sleep $notify_timeout
  fi
done
