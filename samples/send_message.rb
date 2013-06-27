#!/usr/bin/env ruby
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

user = ARGV.shift || "shokaishokai"
msg  = ARGV.shift || "hello"
p Skype.message user, msg
