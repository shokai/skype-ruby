#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

chats = Skype.chats
puts "#{chats.length} chats found"
chat = chats.find{|c| c.members.include? "shokai_bot" and c.topic =~ /増井研/}

p chat
puts chat.topic
chat.post "test"

chat.messages.each do |m|
  puts m
end
