# frozen_string_literal: true

require 'spec_helper'
require 'pathname'
require 'pry'

describe DataParser do
  let(:visits_count) do
    { '/index' => 2, '/about' => 1, '/home' => 1 }
      .to_a.sort_by { |item| item[1] }
      .reverse
      .map { |i| i.map(&:to_s).join(' ') }
  end

  let(:container_valid_ips) { build(:container_valid_ips) }
  let(:data_parser) { DataParser.new(container_valid_ips) }

  it 'size of uniq urls is 3' do
    data_parser.execute(:all)
    expect(container_valid_ips.result.size).to eq 3
  end

  it 'group lines by url ' do
    data_parser.execute(:all)
    expect(container_valid_ips.result).to be_a Array
  end

  it 'count visits by url' do
    data_parser.execute(:all)
    expect(container_valid_ips.result).to eq(visits_count)
  end
end
