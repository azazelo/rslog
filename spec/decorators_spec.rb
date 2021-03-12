# frozen_string_literal: true

require 'spec_helper'

describe Decorators do
  it 'get all title' do
    expect(Decorators.all_title)
      .to eq('List of webpages with most page views ordered from most views to less')
  end
  it 'get all suffix' do
    expect(Decorators.all_suffix)
      .to eq('visits')
  end
  it 'get uniq title' do
    expect(Decorators.uniq_title)
      .to eq('List list of webpages with most unique page views also ordered')
  end
  it 'get all title' do
    expect(Decorators.uniq_suffix)
      .to eq('unique views')
  end
  it 'get separator' do
    expect(Decorators.separator)
      .to eq('-' * 30)
  end
end
