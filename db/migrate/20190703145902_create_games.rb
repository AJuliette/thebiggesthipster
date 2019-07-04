# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :player_a, index: true
      t.references :player_b, index: true
      t.string :winner

      t.timestamps
    end
  end
end
