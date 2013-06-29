Skype
=====
[Skype Desktop API](http://dev.skype.com/desktop-api-reference) Ruby wrapper for Mac/Linux.

- https://github.com/shokai/skype-ruby
- http://rubygems.org/gems/skype


Platforms
---------
- AppleScript + Mac OSX
- DBus + Linux (testing on Ubuntu 12.04)


Installation
------------

for Mac

    % gem install skype
    % skype-chat

for Linux

    % gem install skype ruby-dbus
    % skype-chat

Gemfile
```ruby
gem "skype"
gem "ruby-dbus" if RUBY_PLATFORM =~ /linux/i
```

Usage
-----
please read [API Reference](http://dev.skype.com/desktop-api-reference) before use.

### load
```ruby
require 'rubygems'
require 'skype'

Skype.config :app_name => "my_skype_app"
```

### Skype API

send message
```ruby
Skype.message "USER_NAME", "hello!!"
Skype.exec "MESSAGE USER_NAME hello!!"
```

call
```ruby
Skype.call "USER_NAME"
Skype.exec "CALL USER_NAME"
```

### Chat API

find a chat
```ruby
chat = Skype.chats.find{|c| c.members.include? "shokaishokai" and c.topic =~ /testchat/ }
```

post message to the chat
```ruby
chat.post "hello chat!!"
```

show chat messages
```ruby
chat.messages.each do |m|
  puts m
end
```

Samples
-------
https://github.com/shokai/skype-ruby/tree/master/samples


Test
----
test requires 2 skype accounts.

    % gem install bundler
    % bundle install
    % export SKYPE_FROM=your_skype_name1
    % export SKYPE_TO=your_skype_name2
    % rake test


Contributing
------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
