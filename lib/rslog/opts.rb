# frozen_string_literal: true

# Service module to give opts
#
module Opts
  VERSION = {
    descr:  ['-v', '--version', 'Show version and exit'],
    action: proc do |_opts|
      puts "#{File.basename($PROGRAM_NAME)}: #{RSlog::VERSION}"
    end
  }.freeze

  HELP = {
    descr:  ['-h', '--help', 'Prints this message and exit'],
    action: proc do |opts|
      puts opts
    end
  }.freeze

  def create_opts
    OptionParser.new do |opts|
      banner(opts)
      help(opts)
      version(opts)
    end
  end

  def banner(opts)
    opts.banner = "Usage: #{File.basename($PROGRAM_NAME)} FILENAME"
  end

  def version(opts)
    opts.on(*Opts::VERSION[:descr]) do
      Opts::VERSION[:action].call(opts)
      exit
    end
  end

  def help(opts)
    opts.on(*Opts::HELP[:descr]) do
      Opts::HELP[:action].call(opts)
      exit
    end
  end
end
