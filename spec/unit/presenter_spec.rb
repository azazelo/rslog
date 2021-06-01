# frozen_string_literal: true

require 'spec_helper'

describe RSlog::Presenter do
  let(:presenter) { RSlog::Presenter.new(sorted_hash, conf) }

  it 'output result' do
    expect { presenter.present }
      .to output(%r{Title\s/index})
      .to_stdout_from_any_process
  end
end
