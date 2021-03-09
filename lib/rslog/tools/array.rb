# frozen_string_literal: true

# Monkey patch for Array class 
#  
class Array
  def group_by_index(index = 0)
    group_by { |str| str.split(' ')[index] }
  end

  def to_multiline_string(suffix = '')
    self.map {|item| "#{item} #{suffix}"}.join("\n")
  end
end
