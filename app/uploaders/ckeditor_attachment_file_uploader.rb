# frozen_string_literal: true

require 'carrierwave'

class CkeditorAttachmentFileUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave
  include Cloudinary::CarrierWave
  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience



  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  #******* Was not commented out when starting*************
  # def store_dir
  #   "uploads/ckeditor/attachments/#{model.id}"
  # end

  # Choose what kind of storage to use for this uploader:
  storage :file

  def extension_white_list
    Ckeditor.attachment_file_types
  end
end
