# frozen_string_literal: true

require 'forwardable'

module RSlog
  # Class to parse data
  #
  class Parser
    attr_reader :data_processing

    extend Forwardable
    def_delegators :@data_processing, :extract, :group, :calculate, :order

    def initialize(data_processing)
      @data_processing = data_processing
    end

    def parse
      data_processing.extract.group.calculate.order.result
    end
  end
end
