class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :name
      t.string :desc
      t.integer :price
      t.string :image
      t.timestamps
    end
  end
end