# frozen_string_literal: true

class AddHealthPointsToTurns < ActiveRecord::Migration[5.2]
  def change
    change_table :turns, bulk: true do |t|
      t.integer :attacker_health_points
      t.integer :attacked_health_points
    end
  end
end
