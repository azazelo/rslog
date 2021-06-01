# frozen_string_literal: true

module RSlog
  # Class to parse data
  #
  class Parser
    attr_reader :calc, :separator, :source

    def initialize(source, conf)
      @calc      = conf.fetch(:calc)      { proc }
      @separator = conf.fetch(:separator, ' ')
      @source = source
    end

    def execute
      Array(source)
        .map { |item| item.split(separator) } # extract, returns Array
        .group_by { |page_name, _visits| page_name }                # group, returns Hash
        .map { |page_name, visits| [page_name, calc.call(visits)] } # calculate, returns Array
        .sort_by { |_page_name, visits_by_page| visits_by_page }    # sort, returns Array
        .reverse
    end
  end
end
