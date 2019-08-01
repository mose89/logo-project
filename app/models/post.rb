class Post < ApplicationRecord
  has_many :comments
  mount_uploader :thumbnail, ThumbnailUploader

  extend FriendlyId
  friendly_id :title, use: :slugged
end
