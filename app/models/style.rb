class Style < ApplicationRecord
  has_many :orders
  mount_uploader :image, StyleImageUploader
end
