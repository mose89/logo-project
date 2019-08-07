class Product < ApplicationRecord
  has_many :package_products
  has_many :packages, :through => :package_products
  has_and_belongs_to_many :orders
  mount_uploader :photo, ProductImageUploader

  extend FriendlyId
  friendly_id :name, use: :slugged


  def self.product_sales_hash
    prod_hash = Hash.new
    a = SingleOrder.group(:product_id).count
    a.each do |id, value|
      prod_hash[Product.find(id).name] = value
    end
    return prod_hash
  end

  def self.product_revenue_hash
    product_hash = Hash.new
    a = SingleOrder.group(:product_id).sum(:total)
    a.each do |id, total|
      product_hash[Product.find(id).name] = total
    end
    return product_hash
  end

end
