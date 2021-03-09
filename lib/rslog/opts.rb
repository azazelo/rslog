# frozen_string_literal: true

# Service module to give opts
#
module Opts
  VERSION = {
    descr:  ['-v', '--version', 'Show version and exit'],
    action: proc do
      puts "#{File.basename($PROGRAM_NAME)}: #{RSlog::VERSION}"
      exit
    end
  }.freeze

  HELP = {
    descr:  ['-h', '--help', 'Prints this message and exit'],
    action: proc do |opts|
      puts opts
      exit
    end
  }.freeze

  def self.create_opts
    OptionParser.new do |opts|
      opts.banner = "Usage: #{File.basename($PROGRAM_NAME)} FILENAME"
      opts.on(*Opts::VERSION[:descr]) { Opts::VERSION[:action].call }
      opts.on(*Opts::HELP[:descr]) { Opts::HELP[:action].call(opts) }
    end
  end
end
