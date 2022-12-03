class CreateTherapists < ActiveRecord::Migration[5.2]
  def change
    create_table :therapists do |t|
      t.string :address
      t.string :phone_number
      t.string :image_url
      t.string :bio
      t.text :labels, array: true, default: []
      t.references :practice, foreign_key: true

      t.timestamps
    end
  end
end
