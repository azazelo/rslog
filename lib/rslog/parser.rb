# frozen_string_literal: true

module RSlog
  # Class to hold data_processing methods
  #
  class DataProcessing
    attr_reader :result

    def initialize(source, conf)
      @calc      = conf.fetch(:calc)      { proc }
      @separator = conf.fetch(:separator, ' ')
      @result = Array(source)
    end

    # extract
    def extract
      @result = @result.map { |item| item.split(@separator) }
      self
    end

    # group
    def group
      @result = @result.group_by { |url, _visits| url }.to_a
      self
    end

    # calculate
    def calculate
      # calculate visits
      @result = @result.map { |url, visits| [url, @calc.call(visits)] }
      # calculate average
      @result = @result.map { |url, visits_qty| [url, visits_qty, (visits_qty.to_f / _total)] }
      self
    end

    # sort
    def order
      @result = @result.sort_by { |_url, visits_by_page| visits_by_page }
      @result.reverse!
      self
    end

    private

    # calculate total
    def _total
      @result.sum { |_url, visits_qty| visits_qty }
    end
  end

  require 'forwardable'
  # Class to parse data
  #
  class Parser
    attr_reader :data_processing

    extend Forwardable
    def_delegators :@data_processing, :extract, :group, :calculate, :order

    def initialize(source, conf)
      @data_processing = DataProcessing.new(source, conf)
    end

    def execute
      data_processing.extract.group.calculate.order.result
    end
  end
end
