class RemoveEnergyInCharacters < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :energy, :integer
  end
end
