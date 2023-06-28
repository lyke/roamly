class CreateTravelTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :travel_taggings do |t|
      t.references :travel, null: false, foreign_key: true
      t.references :travel_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
