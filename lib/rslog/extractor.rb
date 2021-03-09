# frozen_string_literal: true

require_relative 'container'

# Class for extracting data from file
#
class Extractor
  def initialize(container)
    @container = container
    @file_name = container.file_name
  end

  def execute
    check
    self
  end

  private

  def check
    if File.zero?(@file_name)
      @container.add_message 'Empty file'
    else
      @container.data = File.open(@file_name, 'r').to_a
      @container.add_message 'Data in place'
    end
  rescue StandardError => error
    @container.add_error error
  end
end
