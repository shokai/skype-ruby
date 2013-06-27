#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

chats = Skype.chats
puts "#{chats.length} chats found"
chat = chats.find{|c| c.members.include? "shokaishokai" and c.topic =~ /test/}

p chat
chat.post "test"

chat.messages.each do |m|
  puts m
end
