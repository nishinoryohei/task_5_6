class Cart < ApplicationRecord
	belongs_to :item
	belongs_to :user
	validates :item_id, presence: true
	validates :quantity, numericality:{
							only_integer:true,
							greater_than: 0,
	}
end
