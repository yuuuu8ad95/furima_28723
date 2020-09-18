class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :from_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :from_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[a-z0-9]+\z/i }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(
      postal_code: postal_code, from_id: from_id, city: city, 
      address: address, building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end
