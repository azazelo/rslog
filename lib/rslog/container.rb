# frozen_string_literal: true

# Class to hold data and implement processing
#
class Container
  attr_accessor(*%i[
                  argv file_name messages errors data options validator types result
                ])

  def initialize
    @errors = []
    @messages = []
    @validator = :ip
    @types = %i[all uniq]
  end

  def file_name?
    !file_name.empty? && no_errors?
  end

  def data?
    messages.include?('Data in place') && no_errors?
  end

  def no_errors?
    errors.empty?
  end

  def add_message(str)
    messages << str
  end

  def add_error(str)
    errors << str
  end

  def talk
    puts messages.join("\n")
    puts errors.join("\n")
    self
  end

  def process_all
    InputParser.new(self).execute
    Extractor.new(self).execute if file_name?
    validate_parse_present if data?
    talk
    self
  end

  def validate_parse_present
    Validator.new(self).execute
    types.each do |type|
      DataParser.new(self, type).execute
      Presenter.new(self, type, :text).execute
    end
  end
end
