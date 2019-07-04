class AddForeignKeysToPlayersOnGames < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :games, :characters, column: :player_a_id
    add_foreign_key :games, :characters, column: :player_b_id
  end
end
