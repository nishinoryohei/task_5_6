class Cart < ApplicationRecord
	belongs_to :item,optional: true
	belongs_to :user
	validates :item_id, presence: true
	validates :is_purchase, inclusion:{in:[true,false]}
	validates :quantity, numericality:{
							only_integer:true,
							greater_than: 0,
	}

end
