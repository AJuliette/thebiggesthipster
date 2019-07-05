# frozen_string_literal: true

class AddReferencesToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :player_a, index: true
    add_reference :games, :player_b, index: true
  end
end
