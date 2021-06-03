# frozen_string_literal: true

module RSlog
  # Class to validate if we have valid data in lines, for example well formatted IPs
  #
  # Checks if IPs are comply with regex
  # Output message "Valid IPs"/"Invalid IPs"
  #
  module Validator
    TEMPLATES = {
      # IP address regex, source https://regexr.com/38odc
      ip: /\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b/
    }.freeze

    MESSAGES = {
      valid:   proc { |validator_name| "All #{validator_name.upcase}s are valid" },
      invalid: proc { |validator_name| "Some #{validator_name.upcase}s are NOT valid" }
    }.freeze

    def validate(source)
      puts
      puts MESSAGES[_valid?(source)].call(:ip)
      puts
    end

    private
    
    def _valid?(source)
      return :valid if source.all? TEMPLATES[:ip]

      :invalid
    end
  end
end
