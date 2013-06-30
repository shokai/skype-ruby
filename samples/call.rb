#!/usr/bin/env ruby
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

puts "please put the username to call"
print "> "
to = STDIN.gets.strip
call = Skype.call to

10.downto(0) do |i|
  puts "#{i} - status:#{call.status}"
  sleep 1
end

call.hangup

puts call.status
