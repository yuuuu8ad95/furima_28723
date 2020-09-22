class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :from
  belongs_to_active_hash :day

  belongs_to :user
  has_many_attached :images
  has_one :order

  with_options presence: true do
    validates :images
    validates :name
    validates :explain
    validates :price, numericality: {
      greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
    }, format: { with: /\A[a-z0-9]+\z/i }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :status_id, numericality: { other_than: 1, message: 'Select' }
    validates :cost_id, numericality: { other_than: 1, message: 'Select' }
    validates :from_id, numericality: { other_than: 0, message: 'Select' }
    validates :day_id, numericality: { other_than: 1, message: 'Select' }
  end
end
