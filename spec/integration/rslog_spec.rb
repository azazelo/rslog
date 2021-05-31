# frozen_string_literal: true

require 'spec_helper'

describe RSlog::Handler do
  context 'create appropriate objects' do

    let(:conf) { create :conf }
    let(:extractor ) { RSlog::Extractor.new(conf) }
    let(:groupator ) { RSlog::Groupator.new(conf) }
    let(:validator ) { RSlog::Validator.new(conf) }
    let(:calculator) { RSlog::Calculator.new(conf)}
    let(:sortator  ) { RSlog::Sortator.new(conf)  }
    let(:formattor ) { RSlog::Formattor.new(conf) }
    let(:printor   ) { RSlog::Printor.new(conf)   }
    
    it('creates extractor ') { expect(extractor ).to be_instance_of(RSlog::Extractor) }
    it('creates groupator ') { expect(groupator ).to be_instance_of(RSlog::Groupator) }
    it('creates validator ') { expect(validator ).to be_instance_of(RSlog::Validator) }
    it('creates calculator') { expect(calculator).to be_instance_of(RSlog::Calculator)}
    it('creates sortator  ') { expect(sortator  ).to be_instance_of(RSlog::Sortator)  }
    it('creates formattor ') { expect(formattor ).to be_instance_of(RSlog::Formattor) }
    it('creates printor   ') { expect(printor   ).to be_instance_of(RSlog::Printor)   }
  end
end
