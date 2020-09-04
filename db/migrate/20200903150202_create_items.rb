class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image,              null: false
      t.string :name,               null: false
      t.text :explain,              null: false
      t.integer :category,          null: false
      t.integer :status,            null: false
      t.integer :cost,              null: false
      t.integer :from,              null: false
      t.integer :days,              null: false
      t.integer :price,             null: false
      t.references :user,           foreign_key: true 
      t.timestamps
    end
  end
end
