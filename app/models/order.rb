class Order < ApplicationRecord
  belongs_to :industry
  belongs_to :style
  belongs_to :package
  belongs_to :user
end
