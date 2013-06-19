Skype
=====
[Skype Desktop API](http://dev.skype.com/desktop-api-reference) wrapper for Ruby


Platform
--------
- Mac OSX + Skype.app


Installation
------------

    % gem install skype


Usage
-----
please read [API Reference](http://dev.skype.com/desktop-api-reference) before use.

### load
```ruby
require 'rubygems'
require 'skype'
```

### send message
```ruby
Skype.message "USER_NAME", "hello!!"
```

### call
```ruby
Skype.call "USER_NAME"
```

### get recent chat list
```ruby
puts Skype.search("recentchats")
```

### send message to group chat
```ruby
Skype.chatmessage "#name1/name2;$a1b2cdef3456", "hello chat!!"
```


Contributing
------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
