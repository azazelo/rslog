# frozen_string_literal: true

require 'set'

# Monkey patch for a Hash class to make counts
#
class Hash
  def count_by_groups_all
    res = {}
    each do |group_key, arr|
      res[group_key] = arr.size
    end
    res
  end

  def count_by_groups_uniq
    res = {}
    each do |group_key, arr|
      res[group_key] = Set.new(arr).size
    end
    res
  end

  def count_by_groups_avg
    res = {}
    each do |group_key, arr|
      res[group_key] = arr.size / Set.new(arr).size
    end
    res
  end
end
