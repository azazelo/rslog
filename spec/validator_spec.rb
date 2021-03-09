# frozen_string_literal: true

require 'spec_helper'

describe Validator do
  let(:container_valid_ips) { build(:container_valid_ips) }
  let(:validator_valid) { Validator.new(container_valid_ips) }
  let(:valid_message_ip) { Validator::MESSAGES[:valid].call(:ip) }

  let(:container_invalid_ips) { build(:container_invalid_ips) }
  let(:validator_invalid) { Validator.new(container_invalid_ips) }
  let(:invalid_message_ip) { Validator::MESSAGES[:invalid].call(:ip) }

  it 'validate valid source' do
    validator_valid.execute
    expect(container_valid_ips.messages).to include(valid_message_ip)
  end

  it 'validate invalid source' do
    validator_invalid.execute
    expect(container_invalid_ips.messages).to include(invalid_message_ip)
  end

  it 'validate' do
    expect(validator_valid.send(:validate).to_s).to eq(:valid.to_s)
  end

  it 'validate invalid' do
    expect(validator_invalid.send(:validate).to_s).to eq(:invalid.to_s)
  end
end
