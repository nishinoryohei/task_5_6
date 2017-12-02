module ItemsHelper
	def stock_nil? item
		item.backyard.stock == 0		
	end
	def item_in_cart_already? carts
		cart = carts.first	
		if cart.present? && cart.is_purchase == true
		 	cart.user_id == current_user.id
		end
	end
	def sold_item item_id
		Item.find(item_id)
	end
end
