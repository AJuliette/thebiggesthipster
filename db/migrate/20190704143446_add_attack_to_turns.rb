# frozen_string_literal: true

class AddAttackToTurns < ActiveRecord::Migration[5.2]
  def change
    add_column :turns, :attack, :integer
  end
end
