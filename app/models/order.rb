class Order < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_one :destination
  belongs_to :user
  belongs_to :item
end
