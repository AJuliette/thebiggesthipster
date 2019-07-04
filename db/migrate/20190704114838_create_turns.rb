# frozen_string_literal: true

class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.references :game, foreign_key: true
      t.text :line
      t.references :attacker, index: true
      t.references :attacked, index: true

      t.timestamps
    end
  end
end
