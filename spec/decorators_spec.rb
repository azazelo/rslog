# frozen_string_literal: true

require 'spec_helper'

describe Decorators do
  it 'get all title' do
    expect(all_title)
      .to eq('List of webpages with most page views ordered from most views to less')
  end
  it 'get all suffix' do
    expect(all_suffix)
      .to eq('visits')
  end
  it 'get uniq title' do
    expect(uniq_title)
      .to eq('List list of webpages with most unique page views also ordered')
  end
  it 'get all title' do
    expect(uniq_suffix)
      .to eq('unique views')
  end
  it 'get separator' do
    expect(separator)
      .to eq('-' * 30)
  end
end
