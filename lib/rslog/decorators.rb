# frozen_string_literal: true

# Class to present result in needed format
#
module Decorators
  def all_title
    'List of webpages with most page views ordered from most views to less'
  end

  def all_suffix
    'visits'
  end

  def uniq_title
    'List list of webpages with most unique page views also ordered'
  end

  def uniq_suffix
    'unique views'
  end

  def separator
    '-' * 30
  end
end
