class UserDestination

    include ActiveModel::ActiveModel
    attr_accessor :postal_code, :prefecture_id, :city, :address,  :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city 
    validates :address  
    validates :phone_number
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    destination = Destination(postal_code: postal_code, prefecture_id:prefecture_id, city, :address:city, address:address,  building_name:building_name, phone_number:phone_number, purchase_id: purchase_id)
  end
end