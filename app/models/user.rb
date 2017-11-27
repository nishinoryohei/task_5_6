class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :personal
  has_many :orders
  has_many :items 
  has_many :carts
  accepts_nested_attributes_for :personal
  accepts_nested_attributes_for :orders
end
