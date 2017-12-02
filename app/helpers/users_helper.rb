module UsersHelper
	def user_item_total_fee user
		user.carts.map {|f| 
			if f.is_purchase == true
				f.item.price*f.quantity
			else
				nil.to_i
			end
		}.sum
	end
	def buyer user_id
  		User.find(user_id)
	end
end
