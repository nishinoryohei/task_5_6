# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	
	def order_customer 
	user = User.first
	@cart = Cart.where(user_id: user)
	@purchase_cart = @cart.select{|f| f.is_purchase == true}
	UserMailer.order_customer(user, @purchase_cart )	
	end
	
	def order_exhibitor 
	user = User.find(3)
	@cart = Cart.where(user_id: 1)
	@purchase_cart = @cart.select{|f| f.is_purchase == true}
	UserMailer.order_exhibitor(user, @purchase_cart)	
	end
end
