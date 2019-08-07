class Package < ApplicationRecord
  has_many :package_products, :dependent => :destroy
  has_many :package_services, :dependent => :destroy
  has_many :products, :through => :package_products
  has_many :services, :through => :package_services

  def self.package_sales_hash
    package_hash = Hash.new
    a = Order.group(:package_id).count
    a.each do |id, value|
      package_hash[Package.find(id).name] = value
    end
    return package_hash
  end

  def self.package_revenue_hash
    package_hash = Hash.new
    a = Order.group(:package_id).sum(:total)
    a.each do |id, total|
      package_hash[Package.find(id).name] = total
    end
    return package_hash
  end

end
