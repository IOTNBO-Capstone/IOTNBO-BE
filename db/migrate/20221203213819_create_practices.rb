class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.string :name
      t.string :website_url

      t.timestamps
    end
  end
end
