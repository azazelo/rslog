# frozen_string_literal: true

# Class for extracting data from file
#
class Extractor < Worker
  def execute
    @file_name = @container.file_name
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
  rescue StandardError => e
    @container.add_error e
  end
end
