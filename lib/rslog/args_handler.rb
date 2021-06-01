# frozen_string_literal: true

# Class to hold data and implement processing
#
module RSlog
  module ArgsHandler
    def self.handle(args)
      options = args.reject { |el| (el =~ /^-/).nil? }
      file_names = args - options

      puts 'R(uby)S(imple)log statistics' if options.delete('-h') || args.empty?
      puts "Version #{RSlog::VERSION}"    if options.delete('-v') || args.empty?
      puts "Unknown options #{options.join(', ')}" if options.any?

      file_names
    end
  end
end
