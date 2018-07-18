class Bakery < ApplicationRecord
  has_many :addresses
  mount_uploader :picture, ImageUploader
end
