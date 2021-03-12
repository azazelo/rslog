# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'rslog'
  s.version     = '0.0.14'
  s.required_ruby_version = '~> 2.6.0'
  s.executables << 'rslog'
  s.summary     = 'R(uby)S(tatistic)log'
  s.description = 'Ruby script to get overall Statistic for weblog logs!'
  s.authors     = ['Andrey Eremeev']
  s.email       = 'a.eremeev@outlook.com'
  s.files       = %w[
    lib/rslog.rb
    lib/rslog/container.rb
    lib/rslog/worker.rb
    lib/rslog/data_parser.rb
    lib/rslog/extractor.rb
    lib/rslog/input_parser.rb
    lib/rslog/decorators.rb
    lib/rslog/presenter.rb
    lib/rslog/validator.rb
    lib/rslog/opts.rb
    lib/rslog/tools/array.rb
    lib/rslog/tools/hash.rb
  ]
  s.homepage    = 'https://rubygems.org/gems/rslog'
  s.license     = 'MIT'
end
