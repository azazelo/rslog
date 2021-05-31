# frozen_string_literal: true

# Class to hold data and implement processing
#
module RSlog
  class Handler
    attr_reader :calc, :title, :suffix, :separator, :format_string
    attr_accessor :next_handler, :result

    def initialize(conf)
      @title            = conf.fetch(:title)         { 'Stat Pages' }
      @suffix           = conf.fetch(:suffix)        { 'visits' }
      @calc             = conf.fetch(:calc)          { proc }
      @format_string    = conf.fetch(:format_string) { "%-20s %5.2f" }
      @separator = ' '
      post_initialize(conf)
    end

    def post_initialize(_conf)
      nil
    end

    def next_handler=(handler)
      @next_handler = handler if handler
      handler
    end

    def handle(source)
#      puts '----------------'
#      puts self.class.name
#      print @result
#      puts
      @next_handler.handle(@result) if @next_handler
      nil
    end
  end
end
