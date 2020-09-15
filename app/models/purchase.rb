class Purchase < ApplicationRecord
  has_one :destination
  belongs_to :user
  belonngs_to :item
end
