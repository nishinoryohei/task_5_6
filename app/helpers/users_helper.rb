module UsersHelper
	def user_item_total_fee user
		user.carts.map {|f| f.item.price*f.quantity}.sum
	end
	def item_purchase_already? user
	end
end
