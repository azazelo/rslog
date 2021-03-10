# frozen_string_literal: true

require 'spec_helper'

describe Presenter do
  let(:container) { build(:container_valid_ips) }
  let(:presenter_all) { Presenter.new(container) }
  let(:presenter_uniq) { Presenter.new(container) }

  it 'show uniq suffix' do
    presenter_uniq.execute(:uniq, :text)
    expect(container.messages)
      .to include(Regexp.new(Presenter::DECORATORS[:uniq][:suffix]))
  end
  it 'show suffix' do
    presenter_uniq.execute(:all, :text)
    expect(container.messages)
      .to include(Regexp.new(Presenter::DECORATORS[:all][:suffix]))
  end
  it 'show all title' do
    presenter_uniq.execute(:all, :text)
    expect(container.messages)
      .to include(Regexp.new(Presenter::DECORATORS[:all][:title]))
  end
  it 'show uniq title' do
    presenter_uniq.execute(:uniq, :text)
    expect(container.messages)
      .to include(Regexp.new(Presenter::DECORATORS[:uniq][:title]))
  end
end
