# frozen_string_literal: true

require 'spec_helper'

describe Decorators do
  it 'get separator' do
    expect(separator)
      .to eq('-' * 30)
  end

  context 'when create statistics for `all`' do
    it 'get all title' do
      expect(all_title)
        .to eq('List of webpages with most page views ordered from most views to less')
    end
    it 'get all suffix' do
      expect(all_suffix)
        .to eq('visits')
    end
  end
end

describe Decorators do
  context 'when create statistics for `uniq`' do
    it 'get uniq title' do
      expect(uniq_title)
        .to eq('List of webpages with most unique page views also ordered')
    end
    it 'get uniq suffix' do
      expect(uniq_suffix)
        .to eq('unique views')
    end
  end
end

describe Decorators do
  context 'when create statistics for `avg`' do
    it 'get avg title' do
      expect(avg_title)
        .to eq('List of webpages with average of views also ordered')
    end
    it 'get all suffix' do
      expect(avg_suffix)
        .to eq('average views')
    end
  end
end
