# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :fightings
  has_many :characters, through: :fightings

  has_many :turns

  accepts_nested_attributes_for :characters

  validates :characters, length: { minimum: 2, maximum: 2 }

  def randomize_starter
    first_player = []
    first_player << characters.sample
    second_player = (characters - first_player)
    { first_player: first_player, second_player: second_player }
  end

  def fight(players)
    @first_player = players[:first_player].pop
    @second_player = players[:second_player].pop

    loop do
      turns.create(attacker: @first_player, attacked: @second_player).run
      break if end_of_game

      turns.create(attacker: @second_player, attacked: @first_player).run
      break if end_of_game
    end

    set_winner
  end

  def end_of_game
    @first_player.dead? || @second_player.dead?
  end

  def set_winner
    if @first_player.dead?
      update(winner: @second_player.name)
      fightings.find_by(character_id: @second_player).update(win: true)
      fightings.find_by(character_id: @first_player).update(win: false)
    else
      update(winner: @first_player.name)
      fightings.find_by(character_id: @first_player).update(win: true)
      fightings.find_by(character_id: @second_player).update(win: false)
    end
  end
end
