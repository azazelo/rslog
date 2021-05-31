# frozen_string_literal: true

FactoryBot.define do
  factory :conf do
    { title: "Title", 
      format_string: "%-20s %3d",
      suffix: "visits",
      calc: proc { |visits| visits.size } }
  end
end
