Slack Notification Cookbook
==============

This cookbook sends messages to a [Slack](http://www.slack.com) chatroom using the Incoming
Webhook Integration

Requirements
------------

#### packages
- `slack-notifier` - Uses the [slack-notifier](https://github.com/stevenosloan/slack-notifier.git)
  rubygem to talk to Slack

Attributes
----------

#### slack::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['slack']['webhook_url']</tt></td>
    <td>String</td>
    <td>Your Incoming Webhook URL</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

The api key is the last section of the web hook url

https://hooks.slack.com/services/XXXXXXXXXX/YYYYYYYYY/ZZZZZZZZZZZZZZ

LWRP Usage
-----
In your `metadata.rb` you need to add `depends 'slack'` and add `include_recipe 'slack'` to your recipe. Passing the below will use default attributes

```ruby
slack_notify "Say Summat!"
```

```ruby
slack_notify "send_notification_message" do
  message "This is a notification message"
  webhook_url 'https://hooks.slack.com/services/XXXX/XXXXXXX/XXXXXX'
  not_if { node['im_boring'] }
end
```

```ruby
slack_notify "channel_nothing" do
  message "heres a message to kick off later"
  username 'test_user'
  channels ['foo','bar']
  webhook_url 'https://hooks.slack.com/services/XXXX/XXXXXXX/XXXXXX'
  action :nothing
end

something "talk_as_test_user_to_multiple_channels" do
  notifies :say, "slack[channel_nothing]", :immediately
end
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Ian Henry <ihenry@chef.io>
