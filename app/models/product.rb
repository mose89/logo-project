class Product < ApplicationRecord
  has_and_belongs_to_many :packages
  has_and_belongs_to_many :orders
  mount_uploader :photo, ProductImageUploader

  extend FriendlyId
  friendly_id :name, use: :slugged
end
