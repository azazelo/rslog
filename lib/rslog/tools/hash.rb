# frozen_string_literal: true

require 'set'

class Hash
  def count_by_groups(type = :all)
    res = {}
    each do |group_key, arr|
      res[group_key] = arr.size          if type == :all
      res[group_key] = Set.new(arr).size if type == :uniq
    end
    res
  end
end
