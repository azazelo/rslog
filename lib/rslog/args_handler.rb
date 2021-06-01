# frozen_string_literal: true

module RSlog
  # Module to parse options and arguments
  #
  module ArgsHandler
    def self.handle(args)
      @args = args
      @options = @args.select { |el| el =~ /^-/ }
      if @options.any? || @args.empty?
        handle_options
        return []
      end

      # file_names array
      @args - @options
    end

    def self.handle_options
      show_help || show_version || show_unknown_options_warning
    end

    def self.show_help
      if @options.delete('-h') || @args.empty?
        puts help_message
        return true
      end
      false
    end

    def self.help_message
      %[
  R(uby)S(imple)log statistics
  Usage:
  > rslog filename[.log|.txt]

  > rslog [-h|-v]
     -h - show this info
     -v - show version
      ]
    end

    def self.show_version
      if @options.delete('-v')
        puts "  Version #{RSlog::VERSION}"
        return true
      end
      false
    end

    def self.show_unknown_options_warning
      if @options.any?
        puts "  Unknown options #{@options.join(', ')}"
        return true
      end
      false
    end
  end
end
