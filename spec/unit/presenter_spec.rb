# frozen_string_literal: true

require 'spec_helper'

describe Presenter do
  context 'when type is `all`' do
    let(:container) { build(:container_valid_ips) }
    let(:presenter_all) { Presenter.new(container, :all, :text) }

    it 'show all title' do
      presenter_all.execute
      expect(container.messages)
        .to include(Regexp.new(all_title))
    end
    it 'show all suffix' do
      presenter_all.execute
      expect(container.messages)
        .to include(Regexp.new(all_suffix))
    end
  end
end

describe Presenter do
  context 'when type is `uniq`' do
    let(:container) { build(:container_valid_ips) }
    let(:presenter_uniq) { Presenter.new(container, :uniq, :text) }

    it 'show uniq title' do
      presenter_uniq.execute
      expect(container.messages)
        .to include(Regexp.new(uniq_title))
    end
    it 'show uniq suffix' do
      presenter_uniq.execute
      expect(container.messages)
        .to include(Regexp.new(uniq_suffix))
    end
  end
end

describe Presenter do
  context 'when type is `avg`' do
    let(:container) { build(:container_valid_ips) }
    let(:presenter_avg) { Presenter.new(container, :avg, :text) }

    it 'show avg title' do
      presenter_avg.execute
      expect(container.messages)
        .to include(Regexp.new(avg_title))
    end
    it 'show avg suffix' do
      presenter_avg.execute
      expect(container.messages)
        .to include(Regexp.new(avg_suffix))
    end
  end
end
