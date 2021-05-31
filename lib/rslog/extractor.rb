# frozen_string_literal: true

# Class for extracting data from file
# and puts it in Array of Arrays
# [[page_url1, ip1], [page_url2, ip2], ... ]
# e.g
# [["/help_page/1", "126.318.035.038"], ["/contact", "184.123.665.067"], ["/home", "184.123.665.067"],
#  ["/about/2", "444.701.448.104"], ["/about", "722.247.931.582"]]
#
module RSlog
  class Extractor < Handler
    def post_initialize(conf)
      @sep = conf.fetch(:sep) { ' ' }
    end

    def handle(source)
      source = Array(source)
      @result = source.map{|item| item.split(@sep)}
      super
    end
  end
end