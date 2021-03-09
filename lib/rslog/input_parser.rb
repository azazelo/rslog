# frozen_string_literal: true

require 'optparse'

class InputParser
  OPTS = {
    version: {
      descr:  ['-v', '--version', 'Show version and exit'],
      action: proc do
        puts "#{File.basename($PROGRAM_NAME)}: #{RSlog::VERSION}"
        exit
      end
    },
    help:    {
      descr:  ['-h', '--help', 'Prints this message and exit'],
      action: proc do |opts|
        puts opts
        exit
      end
    }
  }.freeze

  def initialize(container)
    @container = container
    @argv = container.argv
    @file_name = container.file_name
    @options = container.options
    @errors = container.errors
  end

  def execute
    create_opts
    handle_opts
    handle_args
    self
  end

  private

  attr_accessor :opts

  def create_opts
    @opts = OptionParser.new do |opts|
      opts.banner = "Usage: #{File.basename($PROGRAM_NAME)} FILENAME"
      opts.on(*OPTS[:version][:descr]) do
        OPTS[:version][:action].call
      end
      opts.on(*OPTS[:help][:descr]) do
        OPTS[:help][:action].call(opts)
      end
    end
  end

  def handle_opts
    @opts.parse!(into: @container.options)
  rescue OptionParser::InvalidOption => e
    @container.errors << e
  end

  def handle_args
    @container.file_name = ARGV.select { |str| str =~ /.\.log|.\.txt/ }[0] || ''
    @container.errors << 'No file_name provided' if @container.file_name.empty?
  end
end
