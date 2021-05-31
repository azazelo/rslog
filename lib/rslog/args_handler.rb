# frozen_string_literal: true

# Class to hold data and implement processing
#
module RSlog
  class ArgsHandler
    def self.handle_args(args)
      options = args.select{|el| !(el =~ /^-/).nil?}
      file_names = args - options

      puts "Help"          if options.delete('-h') || args.empty?
      puts "Version #{RSlog::VERSION}" if options.delete('-v') || args.empty?
      puts "Unknown options #{options.join(', ')}" if options.any?

      file_names
    end
  end
end
  
