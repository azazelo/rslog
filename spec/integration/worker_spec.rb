# frozen_string_literal: true

require 'spec_helper'

describe Worker do
  context 'create appropriate objects' do
    let(:container) { build(:container) }

    let(:i_p) { InputParser.new(container) }
    it('creates InputParser') { expect(i_p).to be_instance_of(InputParser) }

    let(:validator) { Validator.new(container) }
    it('creates Validator') { expect(validator).to be_instance_of(Validator) }

    let(:extractor) { Extractor.new(container) }
    it('creates Extractor') { expect(extractor).to be_instance_of(Extractor) }

    let(:presenter) { Presenter.new(container, :all, :text) }
    it('creates presenter') { expect(presenter).to be_instance_of(Presenter) }
  end
end
