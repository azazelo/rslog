# frozen_string_literal: true

require_relative 'container'

class Extractor
  def initialize(container)
    @container = container
  end

  def execute
    check
    self
  end

  private

  def check
    if File.zero?(@container.file_name)
      @container.messages << 'Empty file'
    else
      @container.data = File.open(@container.file_name, 'r').to_a
      @container.messages << 'Data in place'
    end
  rescue StandardError => e
    @container.errors << e
  end
end
