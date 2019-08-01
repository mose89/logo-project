class Gallery < ApplicationRecord

  mount_uploader :photo, ProductImageUploader
end
