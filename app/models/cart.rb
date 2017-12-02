class Cart < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	belongs_to :item,optional: true
	belongs_to :user
	belongs_to :order,optional: true
	validates :item_id, presence: true
	validates :is_purchase, inclusion:{in:[true,false]}
	validates :quantity, numericality:{
							only_integer:true,
							greater_than: 0,
	}
	validates :order_id, :numericality => true, :allow_blank => true
end
