# frozen_string_literal: true

require_relative 'tools/hash'
require_relative 'tools/array'

# Class to present result in needed format
#
class Presenter
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

  def initialize(container)
    @container = container
  end

  def execute(type, formatter)
    @type = type
    @container.messages << send("format_as_#{formatter}")
    self
  end

  private

  attr_reader :title, :suffix
  
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
