class RemovePhotoToPlace < ActiveRecord::Migration[7.0]
  def change
    remove_column :places, :photo
  end
end
