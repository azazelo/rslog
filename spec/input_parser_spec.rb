# frozen_string_literal: true

require 'spec_helper'

describe InputParser do
  let(:container) {  build(:container) }
  let(:input_parser) { InputParser.new(container) }

  it 'container have attributes @options and @filename' do
    input_parser.execute
    expect(container).to have_attributes(file_name: '', options: nil, errors: ['No file_name provided'])
  end

  it 'container have file_name set to server.log' do
    ARGV << 'server.log'
    input_parser.execute
    expect(container).to have_attributes(file_name: 'server.log')
  end

  it 'creates version action' do
    expect { Opts::VERSION[:action].call }
      .to output(Regexp.new(RSlog::VERSION))
      .to_stdout_from_any_process
  end

  it 'creates help action' do
    expect { Opts::HELP[:action].call('help') }
      .to output(/help/).to_stdout_from_any_process
  end

  xit 'handle wrong option'
end
