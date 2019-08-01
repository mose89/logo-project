class CompanyDetail < ApplicationRecord
  belongs_to :order, :inverse_of => :company_detail, optional: true
  belongs_to :single_order, :inverse_of => :company_detail, optional: true
end
