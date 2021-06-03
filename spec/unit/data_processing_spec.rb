# frozen_string_literal: true

require 'spec_helper'

describe RSlog::DataProcessing do
  let(:data_processing) { RSlog::DataProcessing.new(source_data, conf) }

  it 'extract.group.calculate.order.result' do
    expect(data_processing.extract.result).to eq(extracted_data)
    expect(data_processing.group.result).to eq(grouped_data)
    expect(data_processing.calculate.result).to eq(calculated_data)
    expect(data_processing.order.result).to eq(sorted_data)
  end
end
