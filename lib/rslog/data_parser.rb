# frozen_string_literal: true

require_relative 'tools/array'
require_relative 'tools/hash'

# Class to parse data from given array
#
class DataParser < Worker
  # type = :count (default) -> just count in groups
  # type = :uniq -> uniq entries in groups
  def initialize(container, type)
    super(container)
    @type = type
  end

  def execute
    container.result =
      container.data
               .group_by_index(0)
               .send("count_by_groups_#{type}")
               .to_a
               .sort_by { |item| item[1] }
               .reverse
               .map { |elem_arr| elem_arr.map(&:to_s).join(' ') }
    self
  end

  private

  attr_reader :type
end
