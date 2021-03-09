# frozen_string_literal: true

require_relative 'tools/hash'
require_relative 'tools/array'

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
    @container.messages << format_as(type, formatter)
    self
  end

  private

  def format_as(type, formatter)
    case formatter
    when :text
      [
        DECORATORS[type][:title],
        @container.result.to_multiline_string(DECORATORS[type][:suffix]),
        separator
      ].join("\n")
    end
  end

  def separator
    '-----------------------------'
  end
end
