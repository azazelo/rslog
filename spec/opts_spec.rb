# frozen_string_literal: true

require 'spec_helper'

describe Opts do
  it 'get version descr' do
    expect(Opts::VERSION[:descr])
      .to eq(['-v', '--version', 'Show version and exit'])
  end
  it 'get version action' do
    expect { Opts::VERSION[:action].call }
      .to output(Regexp.new("#{File.basename($PROGRAM_NAME)}: #{RSlog::VERSION}"))
      .to_stdout_from_any_process
  end
  it 'get help descr' do
    expect(Opts::HELP[:descr])
      .to eq(['-h', '--help', 'Prints this message and exit'])
  end
  it 'get help action' do
    expect { Opts::HELP[:action].call('HELP') }
      .to output(Regexp.new('HELP')).to_stdout_from_any_process
  end
end
