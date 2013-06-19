#!/usr/bin/env ruby
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

p Skype.message "shokaishokai", "hello"
