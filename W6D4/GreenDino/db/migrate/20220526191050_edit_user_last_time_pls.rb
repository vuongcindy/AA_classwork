class EditUserLastTimePls < ActiveRecord::Migration[5.2]
  def change
    remove_index :artworks, :image_url
    remove_index :artworks, :title
    add_index :artworks, [:artist_id, :title], unique: true
  end
end
