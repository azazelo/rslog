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
    LEFT_UP_CORNER =    "\u250c"
    RIGHT_UP_CORNER =   "\u2510"
    LEFT_DOWN_CORNER =  "\u2514"
    RIGHT_DOWN_CORNER = "\u2518"
    VERTICAL_BORDER =   "\u2502"
    HORIZONTAL_BORDER = "\u2500"
    VERTICAL_LEFT_BORDER = "\u251C"
    VERTICAL_RIGHT_BORDER = "\u2524"

    def initialize(source, conf)
      @source = source
      @col_size    = conf.fetch(:col_size, 20)
      @title       = conf.fetch(:title, 'Stat Pages')
      @formatter   = conf.fetch(:formatter, "%-#{@col_size}s")
      @columns     = conf.fetch(:columns, @source&.first&.size || 1)
      @head_titles = conf.fetch(:head_titles, Array.new(@columns, 'title'))
    end

    def present
      puts @title
      puts _top_border
      puts VERTICAL_BORDER + format(@formatter * @columns, *@head_titles) + VERTICAL_BORDER
      puts _middle_border
      puts _formatted_data
      puts _bottom_border
      puts
    end

    private

    def _top_border
      LEFT_UP_CORNER + _horisontal_line + RIGHT_UP_CORNER
    end
    
    def _middle_border
      VERTICAL_LEFT_BORDER + _horisontal_line + VERTICAL_RIGHT_BORDER
    end

    def _bottom_border
      LEFT_DOWN_CORNER + _horisontal_line + RIGHT_DOWN_CORNER
    end

    def _horisontal_line
      HORIZONTAL_BORDER * @col_size * @columns
    end

    def _formatted_data
      @source.map do |row|
        row = row.map(&:to_s)
        VERTICAL_BORDER + format(@formatter * @columns, *row).to_s + VERTICAL_BORDER
      end
    end
  end
end
