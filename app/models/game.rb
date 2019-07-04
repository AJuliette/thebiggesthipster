# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :fightings
  has_many :characters, through: :fightings

  accepts_nested_attributes_for :characters

  validates :characters, length: { minimum: 2, maximum: 2 }

  def randomize_starter
    first_player = []
    first_player << players.sample
    second_player = players - first_player
    { first_player: first_player, second_player: second_player  }
  end

  def calculate_winner(players)
    first_player = players[:first_player]
    second_player = players[:second_player]

    if first_player.alive?
      attack = first_player.attack(second_player)
      second_player.is_attacked(attack)
    end
    if second_player.alive?
      attack = second_player.attack(first_player)
      first_player.is_attacked(attack)
    else end_of_game
    end
  end

  def players
    
  end
end
