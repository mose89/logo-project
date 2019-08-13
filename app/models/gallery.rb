class Gallery < ApplicationRecord
  validates :header, presence: true
  validates :description, presence: true
  validates :photo, presence: true


  mount_uploader :photo, ProductImageUploader
end
