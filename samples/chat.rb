#!/usr/bin/env ruby
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

chats = Skype.chats
puts "#{chats.length} chats found"
chat = chats.find{|c| c.members.include? "shokai_bot"}
p chat

chat.post "test"

chat.messages.each do |m|
  puts m
end

