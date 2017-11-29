class OrdersController < ApplicationController
	def create

		unless params[:personal].nil?
			@order = Order.create
	 		@order.user_id = current_user.id
			@order.order_date = Date.today
			@order.total_fee = view_context.user_item_total_fee current_user
	 		@personal = Personal.new(personal_params)
	 		@personal.user_id = current_user.id
	 		if @order.save && @personal.save
				@cart = Cart.where(user_id: current_user.id)
	 			cart = @cart.select{|f| f.is_purchase == true}
	 			@user_ids = cart.map{|f| f.item.user_id}
	 				@user_ids.uniq.each do |user_id|
	 			    	user = User.find_by(id:user_id)
	 					UserMailer.order_exhibitor(user).deliver
	 				end
	 			@cart.map{|f| f.update(is_purchase: false)}
	 			UserMailer.order_customer(current_user).deliver
	 			flash[:success] = 'お買い上げありがとうございました。'
	 			redirect_to items_path
	 		end
	 	else
	 		@order = Order.create
	 		@order.user_id = current_user.id
			@order.order_date = Date.today
			@order.total_fee = view_context.user_item_total_fee current_user
			if @order.save
	 			@cart = Cart.where(user_id: current_user.id)
	 			@purchase_cart = @cart.select{|f| f.is_purchase == true}
	 			user_ids = @purchase_cart.map{|f| f.item.user_id}
	 				user_ids.uniq.each do |user_id|
	 			    	user = User.find_by(id:user_id)
	 					UserMailer.order_exhibitor(user,@purchase_cart).deliver
	 				end
	 			UserMailer.order_customer(current_user,@purchase_cart).deliver
	 			@cart.map{|f| f.update(is_purchase: false)}
	 			flash[:success] = 'お買い上げありがとうございました。'
	 			redirect_to items_path
	 		end
	 	end
	end
	private
	def order_params
		params.require(:order).permit(:order_date,:user_id)
	end
	def personal_params
		params.require(:personal).permit(:email,:tel,:state,:city,:address,:user_id)
	end
end

