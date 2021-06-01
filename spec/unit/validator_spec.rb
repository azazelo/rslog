# frozen_string_literal: true

require 'spec_helper'

describe RSlog::Validator do
  let(:validator) { RSlog::Validator }

  it 'validate invalid IPs' do
    expect { validator.execute(invalid_ips) }
      .to output(/Some IPs are NOT valid/)
      .to_stdout_from_any_process
  end
  it 'validate valid IPs' do
    expect { validator.execute(valid_data) }
      .to output(/All IPs are valid/)
      .to_stdout_from_any_process
  end
end
