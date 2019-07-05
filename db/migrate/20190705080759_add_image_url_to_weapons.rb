class AddImageUrlToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_column :weapons, :image_url, :string
  end
end
