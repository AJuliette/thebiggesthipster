# frozen_string_literal: true

class RemoveReferencesToGames < ActiveRecord::Migration[5.2]
  def change
    remove_index :games, :player_a_id
    remove_index :games, :player_b_id
  end
end
