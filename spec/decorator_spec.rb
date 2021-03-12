# frozen_string_literal: true

require 'spec_helper'

describe Decorators do
  it 'show all title' do
    expect(Decorators.all_title)
      .to eq('List of webpages with most page views ordered from most views to less')
  end
  it 'show all suffix' do
    expect(Decorators.all_suffix)
      .to eq('visits')
  end
  it 'show uniq title' do
    expect(Decorators.uniq_title)
      .to eq('List list of webpages with most unique page views also ordered')
  end
  it 'show all title' do
    expect(Decorators.uniq_suffix)
      .to eq('unique views')
  end
end
