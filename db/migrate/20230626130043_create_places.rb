class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :photo
      t.integer :duration
      t.boolean :secret_spot, default: false
      t.integer :min_temp
      t.integer :max_temp
      t.boolean :touristic, default: false
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :validation, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
