# frozen_string_literal: true

require 'spec_helper'

describe Container do
  let(:container) { build(:container) }
  it 'file_name? is false' do
    expect(container.file_name?).to eq(false)
  end

  let(:file_name_container) { build(:file_name_container) }
  it 'file_name? is true' do
    expect(file_name_container.file_name?).to eq(true)
  end

  let(:container) { build(:container) }
  it 'data? is false' do
    expect(container.data?).to eq(false)
  end

  let(:container_valid_ips) { build(:container_valid_ips) }
  it 'data? is true' do
    expect(container_valid_ips.data?).to eq(true)
  end
end

describe Container do
  let(:container_valid_ips) { build(:container_valid_ips) }
  it 'talk' do
    expect { container_valid_ips.talk }.to output(/Data in place/).to_stdout
  end

  let(:container_with_errors) { build(:container_with_errors) }
  it 'talk' do
    expect { container_with_errors.talk }.to output(/error/).to_stdout
  end
end
