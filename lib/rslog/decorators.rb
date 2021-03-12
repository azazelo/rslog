# frozen_string_literal: true

# Class to present result in needed format
#
module Decorators
  def self.all_title
    'List of webpages with most page views ordered from most views to less'
  end

  def self.all_suffix
    'visits'
  end

  def self.uniq_title
    'List list of webpages with most unique page views also ordered'
  end

  def self.uniq_suffix
    'unique views'
  end

  def self.separator
    '-----------------------------'
  end
end
