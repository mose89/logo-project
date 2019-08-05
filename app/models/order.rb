class Order < ApplicationRecord
  belongs_to :industry
  belongs_to :style
  belongs_to :package
  has_and_belongs_to_many :products
  has_one :company_detail, inverse_of: :order
  accepts_nested_attributes_for :company_detail


  def self.active_orders
    x = Order.where(active: true)
    x
  end


  def self.sales_this_year
    x = Order.where(created_at: Time.zone.now.beginning_of_year..Time.zone.now.end_of_day).sum(:total)
    return x
  end

  def self.sales_this_month
    x = Order.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_day).sum(:total)
    return x
  end

end
