class Product < ApplicationRecord
  belongs_to :bakery
  belongs_to :category
  mount_uploader :picture, ImageUploader
end
