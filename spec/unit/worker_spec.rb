# frozen_string_literal: true

require 'spec_helper'

describe Worker do
  let(:container_valid_ips) { build(:container_valid_ips) }
  let(:worker) { Worker.new(container_valid_ips) }

  context 'run main process' do
    it 'run validate_parse_present' do
      worker.validate_parse_present
      expect(container_valid_ips.messages).to include(/visits/)
    end

    it 'run process_all' do
      expect { worker.process_all }.to output(/No file_name/).to_stdout
    end
  end
end
