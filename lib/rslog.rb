#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'rslog/container'
require_relative 'rslog/worker'
require_relative 'rslog/input_parser'
require_relative 'rslog/extractor'
require_relative 'rslog/validator'
require_relative 'rslog/data_parser'
require_relative 'rslog/presenter'
require_relative 'rslog/opts'

# For development
# require 'pry'

class RSlog
  VERSION = '0.0.11'

  def self.run
    Container.new.process_all
  end
end

# For development
# RSlog.run.talk
