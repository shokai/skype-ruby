#!/usr/bin/env ruby
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

chats = Skype.chats
puts "#{chats.length} chats found"
p chats[0]
chats[0].messages.each do |m|
  puts m
end
