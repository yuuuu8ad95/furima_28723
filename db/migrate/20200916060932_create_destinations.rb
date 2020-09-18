class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :postal_code,      null: false, default: ""
      t.integer :from_id,   null: false
      t.string :city,             null: false, default: ""
      t.string :address,          null: false, default: ""
      t.string :building_name,                 default: ""
      t.string :phone_number,     null: false
      t.references :order,        foreign_key: true  

      t.timestamps
    end
  end
end
