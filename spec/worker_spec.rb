# frozen_string_literal: true

require 'spec_helper'

describe Worker do
  let(:container_valid_ips) { build(:container_valid_ips) }
  let(:worker) { Worker.new(container_valid_ips) }

  it 'raise exception on call abstract method execute' do
    expect { worker.execute }.to raise_error(NotImplementedError)
  end
end
