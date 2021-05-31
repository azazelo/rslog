# frozen_string_literal: true

# Class for format result according to passed 'format_string'
#
# result is array of formatted strings
# e.g
# [ "/about                 1 visits", 
#   "/about/2               1 visits", 
#   "/home                  1 visits", 
#   "/contact               1 visits", 
#   "/help_page/1           1 visits" ]
# 
module RSlog
  class Formattor < Handler
    def handle(source)
      @result = source.map do |row| 
        "#{format(format_string, *row)} #{suffix}"
      end
      super
    end
  end
end
