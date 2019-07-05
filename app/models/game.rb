# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :player_a, class_name: 'Character'
  belongs_to :player_b, class_name: 'Character'

  belongs_to :weapon_a, class_name: 'Weapon'
  belongs_to :weapon_b, class_name: 'Weapon'

  has_many :turns

  def fight
    loop do
      turns.create(attacker: player_a, attacked: player_b).run(weapon_a)
      break if end_of_game
      turns.create(attacker: player_b, attacked: player_a).run(weapon_b)
      break if end_of_game
    end

    set_winner
  end

  def end_of_game
    player_a.dead? || player_b.dead?
  end

  def set_winner
    if player_a.dead?
      self.update(winner_id: player_b.id)
    else
      self.update(winner_id: player_a.id)
    end
  end

  def winner
    turns.last.attacker
  end

  def loser
    turns.last.attacked
  end
end
