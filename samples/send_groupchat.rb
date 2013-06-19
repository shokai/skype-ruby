#!/usr/bin/env ruby
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

chats = Skype.search "recentchats"
chats = chats.scan(/(#[^\s,]+)[\s,]/).map{|i| i[0] }

chats.each_with_index do |chat, index|
  puts "[#{index}] #{chat}"
end

puts %Q{select chat number 0~#{chats.size-1} ?}
exit 1 unless (n = STDIN.gets.strip) =~ /^\d$/

chat = chats[n.to_i]
puts %Q{#{chat} was selected}

while line = STDIN.gets.strip
  Skype.chatmessage chat, line
end
