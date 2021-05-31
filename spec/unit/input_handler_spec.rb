# frozen_string_literal: true

require 'spec_helper'

describe InputHandler, :aggregate_failures do
  let(:input_parser) { InputParser.new }
  context 'when opts and filename in place' do
    it 'handle opts' do
      ARGF << '-v'
      input_parser.handle_opts
      expect(input_parser.options).to eq(['-v'])
    end
    it 'save options ([])'
    it 'handle args'
    it 'save file_name (String)'
    it 'output [options, file_name, errors]'
  end
  context 'when arg unknown' do
    it 'add error `unknown argument`'
  end
  context 'when no file_name provided' do
    it 'add error `file_name not provided`'
  end
end