class Style < ApplicationRecord
  mount_uploader :image, StyleImageUploader
end
