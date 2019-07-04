# frozen_string_literal: true

FactoryBot.define do
  factory :turn do
    game { nil }
    line { 'MyText' }
    attacker { nil }
    attacked { nil }
  end
end
