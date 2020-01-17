class Gallery < ApplicationRecord
  validates :header, presence: true
  validates :photo, presence: true


  mount_uploader :photo, GalleryPhotoUploader
end
