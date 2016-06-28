Slack Cookbook
==============

This cookbook sends messages to a [Slack](http://www.slack.com) chatroom using the Incoming
Webhook Integration

Platform Support
----------------
The following platforms have been tested with ChefSpec:

```
| ----------------+-----+-----+-----+-----+----- |
|                                                | 0.1.3 |
| ----------------+-----+-----+-----+-----+----- |
| centos-5.8                                     |   X   |
| ----------------+-----+-----+-----+-----+----- |
| centos-6.0                                     |   X   |
| ----------------+-----+-----+-----+-----+----- |
| centos-7.0                                     |   X   |
| ----------------+-----+-----+-----+-----+----- |
| debian-7.4                                     |   X   |
| ----------------+-----+-----+-----+-----+----- |
| fedora-18                                      |   X   |
| ----------------+-----+-----+-----+-----+----- |
| fedora-19                                      |   X   |
| ----------------+-----+-----+-----+-----+----- |
| fedora-20                                      |   X   |
| ----------------+-----+-----+-----+-----+----- |
| freebsd-9.2                                    |   X   |
| ----------------+-----+-----+-----+-----+----- |
| redhat-5.6                                     |   X   |
| ----------------+-----+-----+-----+-----+----- |
| redhat-6.4                                     |   X   |
| ----------------+-----+-----+-----+-----+----- |
| ubuntu-10.04                                   |   X   |
| ----------------+-----+-----+-----+-----+----- |
| ubuntu-12.04                                   |   X   |
| ----------------+-----+-----+-----+-----+----- |
| ubuntu-14.04                                   |   X   |
| ----------------+-----+-----+-----+-----+----- |
```

Requirements
------------

#### packages
- `slackr` - Uses the [slackr](https://github.com/risk-io/slackr)
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
    <td><tt>['slack']['team']</tt></td>
    <td>String</td>
    <td>Your Slack team-name</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['slack']['api_key']</tt></td>
    <td>String</td>
    <td>The Incoming Webhook API key</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

The api key is the last section of the web hook url

https://hooks.slack.com/services/XXXXXXXXXX/YYYYYYYYY/ZZZZZZZZZZZZZZ

LWRP Usage
-----
In your `metadata.rb` you need to add `depends 'slack'` and add `include_recipe 'slack'` to your recipe.

```ruby
slack_say "Say something clever"
```

```ruby
slack_say "say_something_clever" do
  message "Look I'm a Ghost! Boo!"
  icon_emoji ":ghost:"
  not_if { node['im_boring'] }
end
```

```ruby
slack_say "lazy_ghost" do
  message "Boo! I'm still a ghost"
  icon_emoji ":ghost:"
  action :nothing
end

something "talk_as_ghost" do
  notifies :say, "slack_say[lazy_ghost]", :immediately
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
Authors: Jason Rohwedder <jro@risk.io>
