class SingleOrderNote < ApplicationRecord

  validates :description, presence: true


  belongs_to :single_order
  belongs_to :user
end
