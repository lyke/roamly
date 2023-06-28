class CreateTravTravTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :trav_trav_taggings do |t|
      t.references :trav_trav_type_tag, null: false, foreign_key: true
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
