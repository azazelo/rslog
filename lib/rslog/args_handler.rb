# frozen_string_literal: true

module RSlog
  # Class to parse options and arguments
  #
  # returns Array of file names
  #
  module ArgsHandler
#    attr_reader :args, :options
#
#    def initialize(args)
#      @args = args
#      @options = @args.select { |el| el =~ /^-/ }
#    end

    def file_names_from_args(args)
      @args = args
      @options = @args.select { |el| el =~ /^-/ }
      if @options.any? || @args.empty?
        _handle_options
        return []
      end

      # file_names array
      file_names = @args - @options
      return file_names if file_names.all? { |file_name| File.file?(file_name) }

      puts 'There is no file names given. Check input.'
      []
    end

    private

    def _handle_options
      _show_help || _show_version || _show_unknown_options_warning
    end

    def _show_help
      if @options.delete('-h') || @args.empty?
        puts _help_message
        return true
      end
      false
    end

    def _help_message
      %[
  R(uby)S(imple)log statistics
  Usage:
  > rslog filename[.log|.txt]

  > rslog [-h|-v]
     -h - show this info
     -v - show version
      ]
    end

    def _show_version
      if @options.delete('-v')
        puts "  Version #{RSlog::VERSION}"
        return true
      end
      false
    end

    def _show_unknown_options_warning
      if @options.any?
        puts "  Unknown options #{@options.join(', ')}"
        return true
      end
      false
    end
  end
end
