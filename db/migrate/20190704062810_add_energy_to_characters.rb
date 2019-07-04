# frozen_string_literal: true

class AddEnergyToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :energy, :integer
  end
end
