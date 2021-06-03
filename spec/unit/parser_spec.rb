# frozen_string_literal: true

require 'spec_helper'

describe RSlog::Parser do
  let(:parser) { RSlog::Parser.new(source_data, conf) }

  it 'extract lines from file' do
    expect(parser.execute).to eq(sorted_data)
  end
end
