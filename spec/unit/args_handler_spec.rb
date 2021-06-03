# frozen_string_literal: true

require 'spec_helper'

describe RSlog::ArgsHandler do
  let(:args_handler_v) { RSlog::Main.file_names_from_args(['-v']) }
  it 'output version' do
    expect { args_handler_v }
      .to output(/Version #{RSlog::VERSION}/)
      .to_stdout_from_any_process
  end

  let(:args_handler_h) { RSlog::Main.file_names_from_args(['-h']) }
  it 'output info' do
    expect { args_handler_h }
      .to output(/R\(uby\)S\(imple\)log statistics/)
      .to_stdout_from_any_process
  end

  let(:args_handler_unknown) { RSlog::Main.file_names_from_args(['-unknown']) }
  it 'handle unknown option' do
    expect { args_handler_unknown }
      .to output(/Unknown/)
      .to_stdout_from_any_process
  end

  let(:args_handler_file_name) { RSlog::Main.file_names_from_args(['Gemfile']) }
  it 'returns file_name' do
    expect(args_handler_file_name)
      .to include('Gemfile')
  end
end
