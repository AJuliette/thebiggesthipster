class AddWinnerIdInGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :winner, :string
    add_column :games, :winner_id, :bigint, index: true
  end
end
