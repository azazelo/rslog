# frozen_string_literal: true

require 'spec_helper'

describe RSlog::ArgsHandler do
  let(:args_handler) { RSlog::ArgsHandler }

  it 'output version' do
    expect { args_handler.handle(['-v']) }
      .to output(/Version #{RSlog::VERSION}/)
      .to_stdout_from_any_process
  end
  it 'output info' do
    expect { args_handler.handle(['-h']) }
      .to output(/R\(uby\)S\(imple\)log statistics/)
      .to_stdout_from_any_process
  end
  it 'handle unknown option' do
    expect { args_handler.handle(['-unknown']) }
      .to output(/Unknown/)
      .to_stdout_from_any_process
  end
  it 'returns file_name' do
    expect(args_handler.handle(['args_handler_spec']))
      .to include('args_handler_spec')
  end
end
