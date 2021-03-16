# frozen_string_literal: true

require_relative 'tools/hash'
require_relative 'tools/array'

# Class to present result in needed format
#
class Presenter < Worker
  include Decorators

  attr_reader :type, :formatter

  def initialize(container, type, formatter)
    super(container)
    @type = type
    @formatter = formatter
  end

  def execute
    container.add_message send("format_as_#{formatter}")
    self
  end

  private

  def format_as_text
    [
      send("#{type}_title"),
      container.result.to_multiline_string(send("#{type}_suffix")),
      separator
    ].join("\n")
  end
end
