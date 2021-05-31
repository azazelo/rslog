# frozen_string_literal: true

require 'spec_helper'

describe Extractor do
  let(:container_good_log) { build(:container_good_log) }
  let(:extractor_good_log) { Extractor.new(container_good_log) }
  it 'show result for good file' do
    extractor_good_log.execute
    expect(container_good_log.messages).to include('Data in place')
  end

  let(:container_bad_log) { build(:container_bad_log) }
  let(:extractor_bad_log) { Extractor.new(container_bad_log) }
  it 'show result for bad file' do
    extractor_bad_log.execute
    expect(container_bad_log.messages).to include('Data in place')
  end

  let(:container_empty_log) { build(:container_empty_log) }
  let(:extractor_empty_log) { Extractor.new(container_empty_log) }
  it 'show result for empty file' do
    extractor_empty_log.execute
    expect(container_empty_log.messages).to include('Empty file')
  end

  let(:container_non_existing_log) { build(:container_non_existing_log) }
  let(:extractor_non_existing_log) { Extractor.new(container_non_existing_log) }
  it 'show result for non existing file' do
    extractor_non_existing_log.execute
    expect(container_non_existing_log.errors).to include(StandardError)
  end
end
