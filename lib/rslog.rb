#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'rslog/args_handler'
require_relative 'rslog/validator'
require_relative 'rslog/data_processing'
require_relative 'rslog/parser'
require_relative 'rslog/decorator'
require_relative 'rslog/presenter'
require 'set'

module RSlog
  VERSION = '0.0.18'

  # Module to hold main process
  #
  module Main
    extend RSlog::ArgsHandler
    extend RSlog::Validator

    def self.run
      file_names_from_args(ARGV).each do |file_name|
        puts "Statistics for file #{file_name}"

        lines = IO.readlines(file_name)

        validate(lines)

        _process(lines)
      end
    end

    def self._process(lines)
      decorator = RSlog::Decorator.new(:utf)
      _config_sets.each do |conf|
        data_processing = RSlog::DataProcessing.new(lines, conf)
        parsed_data = RSlog::Parser.new(data_processing).parse
        RSlog::Presenter.new(parsed_data, conf, decorator).present
      end
    end

    def self._config_sets
      [{ title:       %(List of webpages with most page views ordered from most pages views to less page views:),
         #          head_titles:     %w[Url Visits Average],
         head_titles: %w[Url Visits],
         calc:        proc { |visits| visits.size } },
       { title:       'List of webpages with most unique page views also ordered:',
         #          head_titles:     %w[Url Unique\ views Average],
         head_titles: %w[Url Unique\ views],
         calc:        proc { |visits| Set.new(visits).size } } ]
    end
  end
end
