# frozen_string_literal: true

# Class to hold worker functionality
#
class Worker
  attr_reader :container

  def initialize(container)
    @container = container
  end

  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
