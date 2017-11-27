module CartsHelper
	def item_in_cart_already? cart
		if user_signed_in?
			unless cart.nil?  
			cart.user_id == current_user.id
			end
		end
	end
	def item_purchase_already?
		
	end
end
