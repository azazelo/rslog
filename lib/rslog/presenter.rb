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
    STR_SIZE = 15

    def initialize(source, conf)
      @source = source
      @title       = conf.fetch(:title, 'Stat Pages')
      @formatter   = conf.fetch(:formatter, "%-#{STR_SIZE}s")
      @suffix      = conf.fetch(:suffix, 'Visits')
      @columns     = conf.fetch(:columns, @source&.first&.size || 1)
      @head_titles = conf.fetch(:head_titles, Array.new(@columns, 'title'))
    end

    def present
      puts @title
      puts _horizontal_line
      puts format(@formatter * @columns, *@head_titles)
      puts _horizontal_line
      puts _formatted_data
      puts _horizontal_line
      puts
    end

    private

    def _horizontal_line
      '-' * STR_SIZE * @columns
    end

    def _formatted_data
      @source.map do |row|
        row = row.map(&:to_s)
        format(@formatter * @columns, *row).to_s
      end
    end
  end
end
