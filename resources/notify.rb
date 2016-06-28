actions        :notify
default_action :notify

attribute      :message,     :kind_of => String, :name_attribute => true
attribute      :channels,    :kind_of => Array
attribute      :username,    :kind_of => String
attribute      :webhook_url, :kind_of => String

def initialize(*args)
  super
  @action = :notify
end
