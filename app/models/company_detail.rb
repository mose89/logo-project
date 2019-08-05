class CompanyDetail < ApplicationRecord
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
