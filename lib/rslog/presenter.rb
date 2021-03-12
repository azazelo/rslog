# frozen_string_literal: true

require_relative 'tools/hash'
require_relative 'tools/array'

# Class to present result in needed format
#
class Presenter < Worker
  include Decorators

  attr_accessor :type

  def execute(type, formatter)
    @type = type
    container.add_message send("format_as_#{formatter}")
    self
  end

  private

  def format_as_text
    [
      Decorators.send("#{type}_title"),
      container.result.to_multiline_string(Decorators.send("#{type}_suffix")),
      separator
    ].join("\n")
  end

  def separator
    '-----------------------------'
  end
end
