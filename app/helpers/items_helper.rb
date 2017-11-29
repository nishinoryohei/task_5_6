module ItemsHelper
	def stock_nil?(item)
		item.backyard.stock == 0		
	end
	def item_in_cart_already? cart
		if user_signed_in?
			unless cart.nil?  
			cart.user_id == current_user.id
			end
		end
	end
	def item_purchase_already? cart
		cart.is_purchase == true
	end
end
