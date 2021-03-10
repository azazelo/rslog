# frozen_string_literal: true

require_relative 'tools/array'

# Class to validate if we have valid data in lines, for example well formatted IPs
#
class Validator < Worker
  TEMPLATES = {
    # IP address regex, source https://regexr.com/38odc
    ip: /\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b/
  }.freeze

  MESSAGES = {
    valid:   proc { |validator| "All #{validator.upcase}s are valid" },
    invalid: proc { |validator| "Some #{validator.upcase}s are NOT valid" }
  }.freeze

  def execute
    @container.add_message MESSAGES[validate].call(@container.validator)
    self
  end

  private

  def validate
    return :valid if @container.data.all? TEMPLATES[@container.validator]

    :invalid
  end
end
