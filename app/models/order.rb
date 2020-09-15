class Order < ApplicationRecord
  belongs_to :user
  belonngs_to :item
end
