# frozen_string_literal: true

# Class to hold worker functionality
#

class Worker
  attr_reader :container

  def initialize(container)
    @container = container
  end

  def process_all
    InputParser.new(container).execute
    Extractor.new(container).execute if container.file_name?
    validate_parse_present if container.data?
    container.talk
    self
  end

  def validate_parse_present
    Validator.new(container).execute
    container.types.each do |type|
      DataParser.new(container, type).execute
      Presenter.new(container, type, :text).execute
    end
  end
end
