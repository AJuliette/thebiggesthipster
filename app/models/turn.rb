# frozen_string_literal: true

require 'faker'

class Turn < ApplicationRecord
  belongs_to :game
  belongs_to :attacker, class_name: 'Character'
  belongs_to :attacked, class_name: 'Character'

  default_scope { order(created_at: :asc) }

  def run(weapon)
    update(attacker_health_points: attacker.health_points, attacked_health_points: attacked.health_points)
    attack = attacker.attack(weapon)
    attacked.is_attacked(attack)
    update(line: Faker::Hipster.sentence(attack), attack: attack)
  end
end
