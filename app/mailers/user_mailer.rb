class UserMailer < ApplicationMailer
  	def order_customer (user , purchase_cart)
  		@purchase_cart = purchase_cart
  		@user = user
  		mail to: user.email, subject: 'お買い上げありがとうございます'
  	end

  	def order_exhibitor (user , purchase_cart)
  		@purchase_item = purchase_cart.map(&:item).select{|f| f.user_id == user.id}
  		@user =  user
  		mail to: user.email 
    	mail(subject: "商品が購入されました")
  	end
end
