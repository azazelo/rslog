# frozen_string_literal: true

require 'yaml'

module RSlog
  # Class for load borders for table
  #
  class Decorator
    FILE_PATH = "lib/rslog/decorators.yml"
    
    attr_reader :decorators
    
    def initialize(coding=:utf)
      @coding = String(coding)
      @decorators = YAML.load_file(FILE_PATH)[@coding]
      @decorators.each do |name, value|
        instance_variable_set("@#{name}", value)
        Decorator.attr_reader name.to_sym
      end
    end
  end
end
