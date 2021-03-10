# frozen_string_literal: true

require_relative 'worker'
require_relative 'tools/hash'
require_relative 'tools/array'

# Class to present result in needed format
#
class Presenter < Worker
  DECORATORS = {
    all:  {
      title:
              'List of webpages with most page views ordered from most views to less',
      suffix: 'visits'
    },
    uniq: {
      title:  'List list of webpages with most unique page views also ordered',
      suffix: 'unique views'
    }
  }.freeze

  def execute(type, formatter)
    @type = type
    @container.add_message send("format_as_#{formatter}")
    self
  end

  private

  def title
    decorator[:title]
  end

  def suffix
    decorator[:suffix]
  end

  def decorator
    DECORATORS[@type]
  end

  def format_as_text
    [
      title,
      @container.result.to_multiline_string(suffix),
      separator
    ].join("\n")
  end

  def separator
    '-----------------------------'
  end
end
