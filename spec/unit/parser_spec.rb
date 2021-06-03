# frozen_string_literal: true

require 'spec_helper'

describe RSlog::Parser do
#  let(:data_processing) { RSlog::DataProcessing.new(source_data, conf)}
  let(:data_processing) { double RSlog::DataProcessing }
  let(:parser) { RSlog::Parser.new(data_processing) }
  before { 
    allow(data_processing).to receive(:extract).and_return(data_processing)
    allow(data_processing).to receive(:group).and_return(data_processing)
    allow(data_processing).to receive(:calculate).and_return(data_processing)
    allow(data_processing).to receive(:order).and_return(data_processing)
    allow(data_processing).to receive(:result).and_return(sorted_data)
  }

  it 'extract lines from file' do
    expect(parser.parse).to eq(sorted_data)
  end
end
