class Order < ApplicationRecord
	belongs_to :user
	has_many :carts
	validates :total_fee, presence: true ,numericality:{
							only_integer:true,
							greater_than: 0,
	}
end
