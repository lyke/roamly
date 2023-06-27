class CreateTravels < ActiveRecord::Migration[7.0]
  def change
    create_table :travels do |t|
      t.references :user, null: false, foreign_key: true
      t.date :beginning_date
      t.date :ending_date
      t.float :longitude
      t.float :latitude
      t.integer :nb_traveler
      t.boolean :incl_secret
      t.float :budget
      t.integer :touristic
      t.string :starting_point
      t.integer :local_temperature
      t.datetime :start_hour
      t.datetime :end_hour

      t.timestamps
    end
  end
end
