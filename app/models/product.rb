class Product < ApplicationRecord
  belongs_to :categorical
  belongs_to :shop
end
