class Product < ApplicationRecord
  belongs_to :bakery
  belongs_to :category
end
