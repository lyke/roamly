class CreatePlaceTravTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :place_trav_taggings do |t|
      t.references :place, null: false, foreign_key: true
      t.references :place_traveler_type_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
