# frozen_string_literal: true

# Service module to give opts
#
module Opts
  VERSION = {
    descr:  ['-v', '--version', 'Show version and exit'],
    action: proc do
      puts "#{File.basename($PROGRAM_NAME)}: #{RSlog::VERSION}"
    end
  }.freeze

  HELP = {
    descr:  ['-h', '--help', 'Prints this message and exit'],
    action: proc do |opts|
      puts opts
    end
  }.freeze

  def self.create_opts
    OptionParser.new do |opts|
      opts.banner = "Usage: #{File.basename($PROGRAM_NAME)} FILENAME"
      help(opts)
      opts.on(*Opts::HELP[:descr]) do
        Opts::HELP[:action].call(opts)
        exit
      end
    end
  end

  def self.help(opts)
    opts.on(*Opts::VERSION[:descr]) do
      Opts::VERSION[:action].call
      exit
    end
  end
end
