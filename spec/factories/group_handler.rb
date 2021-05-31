# frozen_string_literal: true

FactoryBot.define do
  factory :group_handler, RSlog::GroupHandler do
    conf { FactoryBot.create :conf }
  end
end
