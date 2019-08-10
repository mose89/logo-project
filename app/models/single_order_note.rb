class SingleOrderNote < ApplicationRecord
  belongs_to :single_order
  belongs_to :user
end
