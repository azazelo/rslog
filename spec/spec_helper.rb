# frozen_string_literal: true

require 'factory_bot'

require 'simplecov'
SimpleCov.start

require_relative 'support/file_fixtures'
require_relative '../lib/rslog'
require_relative '../lib/rslog/container'
require_relative '../lib/rslog/input_parser'
require_relative '../lib/rslog/validator'
require_relative '../lib/rslog/extractor'
require_relative '../lib/rslog/data_parser'
require_relative '../lib/rslog/presenter'
require_relative '../lib/rslog/decorators'
require_relative '../lib/rslog/tools/array'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  # config.supports_block_expectations = true
  config.include FileFixtures

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
