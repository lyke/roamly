class CreatePlaceTravelerTypeTags < ActiveRecord::Migration[7.0]
  def change
    create_table :place_traveler_type_tags do |t|
      t.string :tag

      t.timestamps
    end
  end
end
