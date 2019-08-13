class Task < ApplicationRecord

  validates :description, presence: true
  validates :deadline, presence: true


  belongs_to :user
end
