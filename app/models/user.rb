class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :order_notes
  has_many :single_order_notes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
