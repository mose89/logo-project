class Package < ApplicationRecord
  has_and_belongs_to_many :products
  has_and_belongs_to_many :services

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
