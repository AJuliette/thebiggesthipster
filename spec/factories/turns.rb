# frozen_string_literal: true

# == Schema Information
#
# Table name: turns
#
#  id                     :bigint           not null, primary key
#  game_id                :bigint
#  line                   :text
#  attacker_id            :bigint
#  attacked_id            :bigint
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  attack                 :integer
#  attacker_health_points :integer
#  attacked_health_points :integer
#


FactoryBot.define do
  factory :turn do
    game { nil }
    line { 'MyText' }
    attacker { nil }
    attacked { nil }
  end
end
