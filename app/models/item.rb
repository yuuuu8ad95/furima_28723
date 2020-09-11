class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :from
  belongs_to_active_hash :day 

  belongs_to :user
  has_one_attached :image
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :price
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :cost_id, numericality: { other_than: 1 }
    validates :from_id, numericality: { other_than: 0 }
    validates :day_id, numericality: { other_than: 1 }
  end
 
end
