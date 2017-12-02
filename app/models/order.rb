class Order < ApplicationRecord
	belongs_to :user
	has_many :carts
	validates :total_fee, presence: true ,numericality: :only_integer
end
