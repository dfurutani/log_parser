#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'
require_relative 'lib/log_parser'

# ./parser.rb filename
filename = ARGV[0]

# validates arguments (must be present, file must exist)
raise StandardError.new, 'filename is required' if filename.to_s.empty?
raise StandardError.new, 'file not found' unless Pathname.new(filename.to_s).exist?

parser = LogParser.new(filename)

parser.perform
