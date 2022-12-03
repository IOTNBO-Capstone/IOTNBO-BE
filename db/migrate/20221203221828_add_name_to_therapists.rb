class AddNameToTherapists < ActiveRecord::Migration[5.2]
  def change
    add_column :therapists, :name, :string
  end
end
