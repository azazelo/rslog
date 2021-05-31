# frozen_string_literal: true

# Class for extracting data from file
# 
# result is sorted by numbers in second elemet of array
# array of arrays sorted
#  [["/help_page/1", 89],
#   ["/contact", 80]...]
#
module RSlog
  class Sortator < Handler
    def handle(source)
      @result = source
                .sort_by{|_page_name, visits_by_page| visits_by_page }
                .reverse
      super
    end
  end
end