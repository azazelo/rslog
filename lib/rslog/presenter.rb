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
    def initialize(source, conf)
      @source = source
      @col_size    = conf.fetch(:col_size, 20)
      @title       = conf.fetch(:title, 'Stat Pages')
      @formatter   = conf.fetch(:formatter, "%-#{@col_size}s")
      @columns     = conf.fetch(:columns, @source&.first&.size || 1)
      @head_titles = conf.fetch(:head_titles, Array.new(@columns, 'title'))
      @decorator   = conf.fetch(:decorator, RSlog::Decorator.new(:utf))
    end

    def present
      puts @title
      puts _top_border
      puts @decorator.vertical_border + _formatted_head_titles + @decorator.vertical_border
      puts _middle_border
      puts _formatted_data
      puts _bottom_border
      puts
    end

    private

    def _top_border
      @decorator.left_up_corner + _horisontal_line + @decorator.right_up_corner
    end

    def _middle_border
      @decorator.vertical_left_border + _horisontal_line + @decorator.vertical_right_border
    end

    def _bottom_border
      @decorator.left_down_corner + _horisontal_line + @decorator.right_down_corner
    end

    def _horisontal_line
      @decorator.horizontal_border * @col_size * @columns
    end
    
    def _formatted_head_titles
      format(@formatter * @columns, *@head_titles)
    end

    def _formatted_data
      @source.map do |row|
        row = row.map(&:to_s)
        @decorator.vertical_border + 
        format(@formatter * @columns, *row).to_s +  
        @decorator.vertical_border
      end
    end
  end
end
