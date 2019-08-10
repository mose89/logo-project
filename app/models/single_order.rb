class SingleOrder < ApplicationRecord
  belongs_to :product
  has_one :company_detail, inverse_of: :single_order
  accepts_nested_attributes_for :company_detail
  has_many :single_order_notes

  mount_uploader :design, SingleOrderUploader




  def self.active_orders
    x = SingleOrder.where(active: true)
    x
  end

  def self.sales_this_year
    x = SingleOrder.where(created_at: Time.zone.now.beginning_of_year..Time.zone.now.end_of_day).sum(:total)
    return x
  end

  def self.sales_this_month
    x = SingleOrder.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_day).sum(:total)
    return x
  end

end
