# frozen_string_literal: true

module RSlog
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
  class Presenter
    attr_reader :title, :format_string, :suffix, :source

    def initialize(source, conf)
      @source = source
      @title            = conf.fetch(:title, 'Stat Pages')
      @format_string    = conf.fetch(:format_string, '%-20s %5.2f')
      @suffix           = conf.fetch(:suffix, 'visits')
    end

    def present
      puts title
      puts _formatted
      puts
    end

    private

    def _formatted
      source.map do |row|
        "#{format(format_string, *row)} #{suffix}"
      end
    end
  end
end
