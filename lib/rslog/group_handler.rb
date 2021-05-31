# frozen_string_literal: true

# Class for group records by page_url
# 
# result is Hash, { page_url => [[page_url, ip], ...], ... }
# 
# { "/help_page/1"=>[["/help_page/1", "126.318.035.038"]], 
#   "/contact"=>[["/contact", "184.123.665.067"]], 
#   "/home"=>[["/home", "184.123.665.067"]], 
#   "/about/2"=>[["/about/2", "444.701.448.104"]], 
#   "/about"=>[["/about", "722.247.931.582"]] }
# 
#
module RSlog
  class GroupHandler < Handler
    def handle(source)
      @result = source.group_by{|page_name, _visits| page_name }
      super
    end
  end
end
