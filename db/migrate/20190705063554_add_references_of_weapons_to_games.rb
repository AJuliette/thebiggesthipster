class AddReferencesOfWeaponsToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :weapon_a, index: true
    add_reference :games, :weapon_b, index: true
  end
end
