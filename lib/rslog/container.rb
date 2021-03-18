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
    @types = %i[all uniq avg]
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
end
