# Introduction

A simple docker image to check if an application status is `200 OK`. If it's not it sends a notification to a Slack channel.

# Usage

```sh
 docker run -it
   -e STATUS_URL="example.org"
   -e SLACK_CHANNEL="#example"
   -e SLACK_USERNAME="statusbot"
   -e SLACK_NOTIFICATION_TEXT="There is a problem! Check 'example.org'"
   -e SLACK_NOTIFICATION_WEBHOOK_URL="http://example.org"
   codegram/status-notify-slack
 ```