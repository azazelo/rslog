# frozen_string_literal: true

require 'optparse'
require_relative 'opts'

# Class to parse input filenames and args
#
class InputParser < Worker
  include Opts

  def execute
    handle_opts
    handle_args
    self
  end

  private

  attr_accessor :opts

  def handle_opts
    Opts.create_opts.parse!(into: @container.options)
  rescue OptionParser::InvalidOption => e
    @container.add_error e
  end

  def handle_args
    @container.file_name = ARGV.select { |str| str =~ /.\.log|.\.txt/ }[0] || ''
    @container.add_error 'No file_name provided' if @container.file_name.empty?
  end
end
