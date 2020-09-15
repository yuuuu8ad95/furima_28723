class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :card_token,       null:false
      t.string :customer_token,   null:false
      t.references :user,         null: false, foreign_key: true
      t.references :item,         null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
