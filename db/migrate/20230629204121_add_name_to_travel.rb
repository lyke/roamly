class AddNameToTravel < ActiveRecord::Migration[7.0]
  def change
    add_column :travels, :name, :string
  end
end
