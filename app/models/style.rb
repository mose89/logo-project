class Style < ApplicationRecord

  validates :name, presence: true
  validates :image, presence: true

  has_many :orders
  mount_uploader :image, StyleImageUploader
end
