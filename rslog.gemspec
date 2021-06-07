# frozen_string_literal: true

require_relative 'lib/rslog'

Gem::Specification.new do |s|
  s.name        = 'rslog'
  s.version     = RSlog::VERSION
  s.required_ruby_version = '~> 2.6.0'
  s.executables << 'rslog'
  s.summary     = 'R(uby)S(tatistic)log'
  s.description = 'Ruby script to get overall Statistic for weblog logs!'
  s.authors     = ['Andrey Eremeev']
  s.email       = 'a.eremeev@outlook.com'
  s.files       = %w[
    lib/rslog.rb
    lib/rslog/args_handler.rb
    lib/rslog/validator.rb
    lib/rslog/data_processing.rb
    lib/rslog/parser.rb
    lib/rslog/decorators.yml
    lib/rslog/decorator.rb
    lib/rslog/presenter.rb
  ]
  s.homepage    = 'https://rubygems.org/gems/rslog'
  s.license     = 'MIT'
end
