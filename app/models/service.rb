class Service < ApplicationRecord

  validates :name, presence: true

  has_many :package_services
  has_many :packages, :through => :package_services
end
