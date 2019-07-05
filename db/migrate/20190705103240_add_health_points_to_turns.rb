class AddHealthPointsToTurns < ActiveRecord::Migration[5.2]
  def change
    add_column :turns, :attacker_health_points, :integer
    add_column :turns, :attacked_health_points, :integer
  end
end
