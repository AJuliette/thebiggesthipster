# frozen_string_literal: true

require 'faker'

class Turn < ApplicationRecord
  belongs_to :game
  belongs_to :attacker, class_name: 'Character'
  belongs_to :attacked, class_name: 'Character'

  def run(weapon)
    attack = attacker.attack(weapon)
    attacked.health_points = attacked.is_attacked(attack)
    update(line: Faker::Hipster.sentence(attack), attack: attack)
  end
end
