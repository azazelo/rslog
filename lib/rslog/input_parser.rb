# frozen_string_literal: true

require 'optparse'
require_relative 'opts'

# Class to parse input filenames and args
#
class InputParser
  include Opts

  def initialize(container)
    @container = container
  end

  def execute
    @opts = Opts.create_opts
    handle_opts
    handle_args
    self
  end

  private

  attr_accessor :opts

  def handle_opts
    @opts.parse!(into: @container.options)
  rescue OptionParser::InvalidOption => error
    @container.add_error << error
  end

  def handle_args
    @container.file_name = ARGV.select { |str| str =~ /.\.log|.\.txt/ }[0] || ''
    @container.add_error 'No file_name provided' if @container.file_name.empty?
  end
end
