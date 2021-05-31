# frozen_string_literal: true

# Class for calculate what is needed according to pased 'proc'
# 
#  result is array of arrays
#  [["/help_page/1", 80],
#   ["/contact", 89]...]
#
module RSlog
  class Calculator < Handler
    def handle(source)
      @result = source.map do |page_name, visits| 
        [page_name, calc.call(visits)]
      end
      super  
    end
  end
end
