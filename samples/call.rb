#!/usr/bin/env ruby
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

puts "please put the username to call"
print "> "
to = STDIN.gets.strip
call = Skype.call to


while !call.talking?
  puts call.status
  sleep 1
end

5.downto(0) do |i|
  puts "#{i} - #{call.status}"
  sleep 1
end

call.hangup if call.talking?

puts call.status
