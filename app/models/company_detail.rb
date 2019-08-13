class CompanyDetail < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :established, presence: true
  validates :referral, presence: true


  # Associations
  belongs_to :order, :inverse_of => :company_detail, optional: true
  belongs_to :single_order, :inverse_of => :company_detail, optional: true

  def self.list
    a = []
    b = []
    x = Order.all{ |order| a << order.company_detail }
    y = SingleOrder.all{ |order| b << order.company_detail }
    z = y + x
    z = z.sort { |a, b| b.created_at <=> a.created_at }
    return z
  end
end
