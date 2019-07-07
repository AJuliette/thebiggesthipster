# frozen_string_literal: true

# == Schema Information
#
# Table name: games
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  player_a_id :bigint
#  player_b_id :bigint
#  weapon_a_id :bigint
#  weapon_b_id :bigint
#  winner_id   :bigint
#


FactoryBot.define do
  factory :game do
    player_a { nil }
    player_b { nil }
    winner { 'MyString' }
  end
end
