#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'rslog/args_handler'
require_relative 'rslog/handler'
require_relative 'rslog/extractor'
require_relative 'rslog/validator'
require_relative 'rslog/group_handler'
require_relative 'rslog/calculator'
require_relative 'rslog/sortator'
require_relative 'rslog/formattor'
require_relative 'rslog/printor'
require 'set'

module RSlog
  VERSION = '0.0.14'

  class Main
    def self.run
      file_names = RSlog::ArgsHandler.handle_args(ARGV)

      return unless file_names.any?
  
      file_names.each do |file_name|
        return unless file_names.all?{|f| File.file?(f) }
        
        lines = IO.readlines(file_name)

        config_sets.each do |conf|
          prepare_objects(conf).handle(lines)
        end
      end
    end
        
    def self.config_sets
      res =  []
      res << { title: %(List of webpages with most page views ordered from most pages views to less page views\ne.g.:),
               format_string: "%-20s %3d",
               suffix: "visits",
               calc: proc { |visits| visits.size } }

      res << { title: "List of webpages with most unique page views also ordered\ne.g.:", 
               format_string: "%-20s %3d",
               suffix: 'unique views',
               calc: proc { |visits| Set.new(visits).size } }

      res << { title: "Average visits sorted", 
               suffix: 'average visits',
               calc: proc { |visits| Set.new(visits).size.to_f / visits.size } }
      res
    end
    
    def self.prepare_objects(conf)
      extractor  = RSlog::Extractor.new(conf)
      group_handler  = RSlog::GroupHandler.new(conf)
      validator  = RSlog::Validator.new(conf)
      calculator = RSlog::Calculator.new(conf)
      sortator   = RSlog::Sortator.new(conf)
      formattor  = RSlog::Formattor.new(conf)
      printor    = RSlog::Printor.new(conf)

      extractor.next_handler  = group_handler
      group_handler.next_handler  = validator
      validator.next_handler  = calculator
      calculator.next_handler = sortator
      sortator.next_handler   = formattor
      formattor.next_handler  = printor
      printor.next_handler    = nil
      
      extractor
    end
  end
end
