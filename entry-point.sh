#!/bin/sh

status_url=$STATUS_URL
status_timeout=$STATUS_TIMEOUT
notify_timeout=$NOTIFY_TIMEOUT
channel=$SLACK_CHANNEL
username=$SLACK_USERNAME
text=$SLACK_NOTIFICATION_TEXT
icon=$SLACK_NOTIFICATION_ICON
webhook_url=$SLACK_NOTIFICATION_WEBHOOK_URL
curl_max_timeout=$CURL_MAX_TIMEOUT
max_fails_allowed=$MAX_FAILES_ALLOWED
fail_count=0;

while :
do
  status=`curl -m $curl_max_timeout -s -o /dev/null -w "%{http_code}" $status_url`
  if [ $status -eq 200 ]; then
    echo "Application works."
	fail_count=0
    sleep $status_timeout
  else
    ((fail_count++))
	echo "fail count: $fail_count"
	if [ $fail_count -ge $max_fails_allowed ]; then
		echo "Application is not working."
		curl -X POST --data-urlencode "payload={\"channel\": \"$channel\", \"username\": \"$username\", \"text\": \"$text\", \"icon_emoji\": \"$icon\"}" $webhook_url
	fi
    sleep $notify_timeout
  fi
done
