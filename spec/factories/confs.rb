# frozen_string_literal: true

FactoryBot.define do
  factory :conf, class: Hash do
    { title: "Title", 
      format_string: "%-20s %3d",
      suffix: "visits",
      calc: Proc.new { |visits| visits.size } }
  end
end
