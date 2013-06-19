#!/usr/bin/env ruby
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

puts "please put the username to call"
print "> "
to = STDIN.gets.strip
p Skype.call to
