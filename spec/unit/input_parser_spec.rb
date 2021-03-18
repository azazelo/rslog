# frozen_string_literal: true

require 'spec_helper'

describe InputParser, :aggregate_failures do
  let(:container) {  build(:container) }
  let(:input_parser) { InputParser.new(container) }

  context 'when no file_name provided' do
    it 'return error `No file_name provided`' do
      input_parser.execute
      expect(container).to have_attributes(file_name: '', options: nil)
      expect(container.errors).to include('No file_name provided')
    end
  end

  context 'when file_name is server.log' do
    it 'container get file_name set to server.log' do
      ARGV << 'server.log'
      input_parser.execute
      expect(container).to have_attributes(file_name: 'server.log')
      ARGV.pop
    end
  end
end

describe InputParser, :aggregate_failures do
  it 'creates version action' do
    expect { Opts::VERSION[:action].call }
      .to output(Regexp.new(RSlog::VERSION))
      .to_stdout_from_any_process
  end

  it 'creates help action' do
    expect { Opts::HELP[:action].call('help') }
      .to output(/help/).to_stdout_from_any_process
  end
end
