# frozen_string_literal: true

class Array
  def group_by_index(index = 0)
    group_by { |str| str.split(' ')[index] }
  end

  def to_multiline_string(suffix = '')
    arr = []
    each do |item|
      arr << "#{item} #{suffix}"
    end
    arr.join("\n")
  end
end
