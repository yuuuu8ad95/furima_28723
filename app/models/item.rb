class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :from
  belongs_to_active_hash :day 

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:  9999999 }, format: { with: /\A[0-9]+\z/ }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :cost_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :from_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :day_id, numericality: { other_than: 1, message: "can't be blank" }
  end

end
