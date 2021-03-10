
# Class to hold worker functionality
#
class Worker
  def initialize(container)
    @container = container
  end
  
  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"  
  end
end