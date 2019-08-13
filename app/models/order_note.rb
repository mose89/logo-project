class OrderNote < ApplicationRecord

  validates :description, presence: true

  belongs_to :order
  belongs_to :user
end
