class CreateTravTravTypeTags < ActiveRecord::Migration[7.0]
  def change
    create_table :trav_trav_type_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
