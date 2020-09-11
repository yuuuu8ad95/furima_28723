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
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category
    validates :status
    validates :cost
    validates :from
    validates :day
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :day_id
  end
  validates :from_id, numericality: { other_than: 0, message: 'Select' }
  validates :price, format: { with: /\A[a-z0-9]+\z/i }
end
