class OrdersController < ApplicationController
	def create
		user_personal_check 
		create_order
	 	if @order.save && @personal.save
	 		order_processing
	 	else
	 		flash[:warning] = '入力が不十分です'
	 		redirect_to user_cart_path
	 	end
	end
	def show
	 	@order = Order.where(user_id: params[:user_id])
	end
	private
	def order_params
		params.require(:order).permit(:order_date,:user_id)
	end
	def personal_params
		params.require(:personal).permit(:email,:tel,:state,:city,:address,:user_id)
	end
	def create_order
		@order = Order.create
	 	@order.user_id = current_user.id
		@order.order_date = Date.today
		@order.total_fee = view_context.user_item_total_fee current_user
	end
	def order_processing
	 		@purchase_cart = Cart.where(user_id: current_user.id, is_purchase: true)
	 			user_ids = @purchase_cart.map{|f| f.item.user_id}
	 				user_ids.uniq.each do |user_id|
	 			    	user = User.find_by(id:user_id)
	 					UserMailer.order_exhibitor(user,@purchase_cart).deliver
	 				end
	 			UserMailer.order_customer(current_user,@purchase_cart).deliver
	 			@purchase_cart.map{|f| f.update(order_id: @order.id, is_purchase: false)}
	 			flash[:success] = 'お買い上げありがとうございました。'
	 			redirect_to items_path
	end
	def user_personal_check
		if current_user.personal.nil?
			@personal = Personal.new(personal_params)
	 		@personal.user_id = current_user.id
	 	end
	end
end

