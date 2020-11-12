# Glip Notify Action

Sends a message to Glip based for the Github Action

This action likely only works on [v1 of Glip's webhook posting](https://developers.ringcentral.com/guide/team-messaging/manual/formatting).

## Inputs

### `webhook_url`

**Required** Glip Webhook URL. You can get this by adding a webhook integration to a Glip conversation.

### `title`

Title of the message. You can customize the message to add information specific to the event.

### `text`

Text of the message. You can customize the message to add information specific to the event.

### `color`

Color of the message. Default: '#CC0000'

## Example usage

```
name: Report Push Failures to Glip
  if: ${{ failure() }}
  uses: anytimefitness/glip-notify-action@v1
  with:
    webhook_url: https://hooks.glip.com/webhook/<guid>
    title: "${{ github.workflow }}: ${{ job.status }} in [${{ github.ref }}](${{ github.event.compare }})"
```

```
name: Report Pull Request Failures to Glip
  if: ${{ failure() }}
  uses: anytimefitness/glip-notify-action@v1
  with:
    webhook_url: https://hooks.glip.com/webhook/<guid>
    title: "${{ github.workflow }}: ${{ job.status }} in [${{ github.event.pull_request.title }}](${{ github.event.pull_request.html_url }})"
```
