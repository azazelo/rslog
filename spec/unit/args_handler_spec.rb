# frozen_string_literal: true

require 'spec_helper'

describe RSlog::ArgsHandler do
  let(:args_handler_v) { RSlog::ArgsHandler.new(['-v']) }
  it 'output version' do
    expect { args_handler_v.handle }
      .to output(/Version #{RSlog::VERSION}/)
      .to_stdout_from_any_process
  end

  let(:args_handler_h) { RSlog::ArgsHandler.new(['-h']) }
  it 'output info' do
    expect { args_handler_h.handle }
      .to output(/R\(uby\)S\(imple\)log statistics/)
      .to_stdout_from_any_process
  end

  let(:args_handler_unknown) { RSlog::ArgsHandler.new(['-unknown']) }
  it 'handle unknown option' do
    expect { args_handler_unknown.handle }
      .to output(/Unknown/)
      .to_stdout_from_any_process
  end

  let(:args_handler_file_name) { RSlog::ArgsHandler.new(['args_handler_spec']) }
  it 'returns file_name' do
    expect(args_handler_file_name.handle)
      .to include('args_handler_spec')
  end
end
