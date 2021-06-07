# frozen_string_literal: true

module RSlog
  # Class to parse data
  #
  class Parser
    attr_reader :data_processing

    def initialize(data_processing)
      @data_processing = data_processing
    end

    def parse
      data_processing.extract.group.calculate.order.result
    end
  end
end
