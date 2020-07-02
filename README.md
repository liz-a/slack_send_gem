# SlackSend

Send messages to slack users with only a valid response url or a bot token and slack user id.

## Installation & Bundler Dependency

### With Rubygems

To install SlackSend with RubyGems:

```
gem install slack_send
```

### Bundler Dependency

To use SlackSend in a project managed with Bundler:

``` ruby
gem 'slack_send', '>= 0.0.1'
```
___

## Configuration

The bot token must be configured in the gem setup before you can send any message without passing a valid response url. You can do this anywhere in your application before using the gem.

```ruby
SlackSend.configure do |config|
  config.bot_token = ''
end
```

* `bot_token` - your Slack API bot token

Getting a bot token requires a (free) Slack account and that you agree to the terms of use for the API.
___

## Basic Usage

### With a response url
```ruby
SlackSend.reply(
  response_url: 'a.valid.slack/response/url',
  message: {},
  attachments: [],
  response_type: 'in_channel'
)
```

* `response_url` - a valid slack response url
* `message` - a correctly formatted message
* `attachments` - **optional** an array of correctly formatted attachments
* `response_type` - **optional** optional - will default to 'ephemeral' if not passed 'in_channel'

### With a user id
```ruby
SlackSend.send(
  user_id: 'lizard123',
  message: {},
  attachments: []
)
```

* `user_id` - a valid slack user id
* `message` - a correctly formatted message
* `attachments` - **optional** an array of correctly formatted attachments

_requires bot token configuration as above_
___

## Message Formatting

See the Slack API documentation for the required format for slack messages and attachments.

[Formatting Guidelines for Messages](https://api.slack.com/docs/message-formatting)

[Formatting Guidelines for Attachments](https://api.slack.com/docs/message-attachments)

[Slack Message Builder](https://api.slack.com/tools/block-kit-builder)

___

Author: Liz Ardolino
