class Order < ApplicationRecord
  belongs_to :industry
  belongs_to :style
  belongs_to :package
  has_and_belongs_to_many :products
  has_one :company_detail, inverse_of: :order
  accepts_nested_attributes_for :company_detail
end
