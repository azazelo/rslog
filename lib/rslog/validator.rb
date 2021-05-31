# frozen_string_literal: true

# Class to validate if we have valid data in lines, for example well formatted IPs
# 
# Checks if IPs are comply with regex
# Output message "Valid IPs"/"Invalid IPs"
#
module RSlog
  class Validator < Handler
    TEMPLATES = {
      # IP address regex, source https://regexr.com/38odc
      ip: /\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b/
    }.freeze

    MESSAGES = {
      valid:   proc { |validator| "All #{validator.upcase}s are valid" },
      invalid: proc { |validator| "Some #{validator.upcase}s are NOT valid" }
    }.freeze

    def handle(source)
      puts MESSAGES[validate(source)].call(:ip)
      @result = source
      super
    end

    private

    def validate(source)
      return :valid if source.all? TEMPLATES[:ip]

      :invalid
    end
  end
end
