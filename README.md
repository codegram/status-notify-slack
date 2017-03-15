# Introduction

A simple docker image to check if an application status is `200 OK`. If it's not it sends a notification to a Slack channel.

# Simple usage

```sh
 docker run -it
   -e STATUS_URL="example.org"
   -e SLACK_CHANNEL="#example"
   -e SLACK_USERNAME="statusbot"
   -e SLACK_NOTIFICATION_TEXT="There is a problem! Check 'example.org'"
   -e SLACK_NOTIFICATION_WEBHOOK_URL="http://example.org"
   codegram/status-notify-slack
 ```

 # Configuration

 The script can be configured using a bunch of environment variables:

 - **`STATUS_URL`**: The application url to check if it is responding with a `200 OK` http status code.
 - **`STATUS_TIMEOUT`**: Time in seconds to retry the ping status. (Default: 1s)
 - **`NOTIFY_TIMEOUT`**: Time in seconds to retry after sending a slack notification. (Default: 5s)
 - **`SLACK_CHANNEL`**: The slack channel name to sent a notification.
 - **`SLACK_USERNAME`**: The slack username that is sending the notification.
 - **`SLACK_NOTIFICATION_TEXT`**: The notification message.
 - **`SLACK_NOTIFICATION_ICON`**: The notification icon. You can use an emoji here.
 - **`SLACK_NOTIFICATION_WEBHOOK_URL`**: The incoming webhook url.
