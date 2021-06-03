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
    attr_reader :source, :title, :format_title, :format_cell, :columns,
                :suffix, :head, :head_titles

    def initialize(source, conf)
      @source = source
      @type          = conf.fetch(:type, :table)
      @title         = conf.fetch(:title, 'Stat Pages')
      @format_title  = conf.fetch(:format_string, '%-20s')
      @format_cell   = conf.fetch(:format_cell, '%-20s')
      @suffix        = conf.fetch(:suffix, 'Visits')
      @columns       = conf.fetch(:columns, @source&.first&.size)
      @head_titles   = conf.fetch(:head_titles, Array.new(@columns, 'title'))
    end

    def present
      puts title
      puts _horizontal_line
      puts format(format_title * columns, *head_titles)
      puts _horizontal_line
      puts _formatted
      puts _horizontal_line
      puts
    end

    private

    def _horizontal_line
      '-' * 20 * columns
    end

    def _formatted
      source.map do |row|
        row = row.map(&:to_s)
        format(format_cell * columns, *row).to_s
      end
    end
  end
end
