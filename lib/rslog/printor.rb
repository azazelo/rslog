# frozen_string_literal: true

# Class for output result
# 
# Output prepared array
#
module RSlog
  class Printor < Handler
    def handle(source)
      puts
      puts @title
      puts source
      super
    end
  end
end