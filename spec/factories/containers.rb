# frozen_string_literal: true

FactoryBot.define do
  factory :container, class: Container do
    file_name { '' }
    options { nil }
    messages { ['message'] }
    data { ['/index 555.111.111.111', '/home  555.111.111.222'] }

    factory(:file_name_container) { file_name { 'file_name.log' } }
    factory(:container_good_log) { file_name { './spec/fixtures/files/good.log' } }
    factory(:container_empty_log) { file_name { './spec/fixtures/files/empty.log' } }
    factory(:container_bad_log) { file_name { './spec/fixtures/files/bad.log' } }
    factory(:container_non_existing_log) { file_name { './spec/fixtures/files/non_existing.log' } }

    factory :container_valid_ips do
      file_name { 'good.log' }
      messages { ['Data in place'] }
      errors { [] }
      result { ['/index 2', '/home 1', '/about 1'] }
      data do
        ['/index 192.160.0.1', '/index 192.160.0.2', '/about 192.160.0.1',
         '/home 192.160.0.1']
      end
    end

    factory(:container_invalid_ips) { data { ['/index 555'] } }
    factory(:container_with_errors) { errors { ['error'] } }
  end
end
