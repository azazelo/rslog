# frozen_string_literal: true

require 'spec_helper'

describe Container do
  let(:container) { build(:container) }
  it 'file_name? is false' do
    expect(container.file_name?).to eq(false)
  end

  let(:file_name_container) { build(:file_name_container) }
  it 'file_name? is true' do
    expect(file_name_container.file_name?).to eq(true)
  end

  let(:container) { build(:container) }
  it 'data? is false' do
    expect(container.data?).to eq(false)
  end

  let(:container_valid_ips) { build(:container_valid_ips) }
  it 'data? is true' do
    expect(container_valid_ips.data?).to eq(true)
  end
end

describe Container do
  let(:container_valid_ips) { build(:container_valid_ips) }
  it 'talk' do
    expect { container_valid_ips.talk }.to output(/Data in place/).to_stdout
  end

  let(:container_with_errors) { build(:container_with_errors) }
  it 'talk' do
    expect { container_with_errors.talk }.to output(/error/).to_stdout
  end

  context 'run main process' do
    let(:container) { build(:container_valid_ips) }

    it 'run validate_parse_present' do
      container.validate_parse_present
      expect(container.messages).to include(/visits/)
    end

    it 'run process_all' do
      expect { container.process_all }.to output(/No file_name/).to_stdout
    end
  end
end

describe Container do
  context 'create appropriate objects' do
    let(:container) { build(:container) }

    let(:i_p) { InputParser.new(container) }
    it('creates InputParser') { expect(i_p).to be_instance_of(InputParser) }

    let(:validator) { Validator.new(container) }
    it('creates Validator') { expect(validator).to be_instance_of(Validator) }

    let(:extractor) { Extractor.new(container) }
    it('creates Extractor') { expect(extractor).to be_instance_of(Extractor) }

    let(:presenter) { Presenter.new(container) }
    it('creates presenter') { expect(presenter).to be_instance_of(Presenter) }
  end
end
