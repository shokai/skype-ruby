#!/usr/bin/env ruby
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

Skype.chats.each do |chat|
  puts "-"*5
  puts "#{chat.id}"
  puts "\"#{chat.topic}\"" unless chat.topic.empty?
  chat.messages.reverse[0...3].each do |m|
    puts m
  end
end
