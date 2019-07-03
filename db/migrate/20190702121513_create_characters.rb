# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :health_points, null: false
      t.integer :attack_damage, null: false

      t.timestamps
    end
  end
end
