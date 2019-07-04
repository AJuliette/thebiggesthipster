# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    player_a { nil }
    player_b { nil }
    winner { 'MyString' }
  end
end
