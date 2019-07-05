# frozen_string_literal: true

class AddForeignKeysToWeaponsOnGames < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :games, :weapons, column: :weapon_a_id
    add_foreign_key :games, :weapons, column: :weapon_b_id
  end
end
