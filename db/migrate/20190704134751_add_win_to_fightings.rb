# frozen_string_literal: true

class AddWinToFightings < ActiveRecord::Migration[5.2]
  def change
    add_column :fightings, :win, :boolean
  end
end
