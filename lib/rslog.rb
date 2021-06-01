#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'rslog/args_handler'
require_relative 'rslog/validator'
require_relative 'rslog/parser'
require_relative 'rslog/presenter'
require 'set'

module RSlog
  VERSION = '0.0.15'

  # Module to hold main process
  #
  module Main
    def self.run
      file_names.each do |file_name|
        puts "Statistics for file #{file_name}"

        lines = IO.readlines(file_name)

        RSlog::Validator.execute(lines)

        process(config_sets, lines)
      end
    end

    def self.process(config_sets, lines)
      config_sets.each do |conf|
        parsed = RSlog::Parser.new(lines, conf).execute
        RSlog::Presenter.new(parsed, conf).present
      end
    end

    def self.file_names
      file_names = RSlog::ArgsHandler.handle(ARGV)
      return file_names if file_names.all? { |file_name| File.file?(file_name) }

      puts 'There is no file names given. Check input.'
      []
    end

    def self.config_sets
      [{ title:         %(List of webpages with most page views ordered from most pages views to less page views:),
         format_string: '%-20s %3d',
         calc:          proc { |visits| visits.size } },

       { title:         'List of webpages with most unique page views also ordered:',
         format_string: '%-20s %3d',
         suffix:        'unique views',
         calc:          proc { |visits| Set.new(visits).size } },

       { title:  'Average visits sorted:',
         suffix: 'average visits',
         calc:   proc { |visits| Set.new(visits).size.to_f / visits.size } }]
    end
  end
end
