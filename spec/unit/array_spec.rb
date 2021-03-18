# frozen_string_literal: true

require 'spec_helper'

describe Array do
  let(:arr) do
    [
      '/index 1.1.1.1',
      '/index 2.2.2.2',
      '/home 2.2.2.2',
      '/about 3.3.3.3'
    ]
  end

  let(:grouped_hash) do
    {
      '/index' => ['/index 1.1.1.1', '/index 2.2.2.2'],
      '/home' => ['/home 2.2.2.2'],
      '/about' => ['/about 3.3.3.3']
    }
  end

  let(:bad_array) { [1, 2, 3] }

  let(:multiline_string) do
    "/index 1.1.1.1 \n/index 2.2.2.2 \n/home 2.2.2.2 \n/about 3.3.3.3 "
  end

  it 'group by_index index = 1' do
    expect(arr.group_by_index(0)).to eq(grouped_hash)
  end

  it 'creates multiline string' do
    expect(arr.to_multiline_string).to eq(multiline_string)
  end
end
