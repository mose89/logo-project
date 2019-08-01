class SingleOrder < ApplicationRecord
  belongs_to :product
  has_one :company_detail, inverse_of: :single_order
  accepts_nested_attributes_for :company_detail

  mount_uploader :design, SingleOrderUploader
end
