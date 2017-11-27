class OrdersController < ApplicationController
	def create
		@order = Order.create
	 	@order.user_id = current_user.id
		@order.order_date = Date.today
		@order.total_fee = view_context.user_item_total_fee current_user
	 	@personal = Personal.new(personal_params)
	 	@personal.user_id = current_user.id
	 	if @order.save && @personal.save
	 		@cart = Cart.where(user_id: current_user.id)
	 		@cart.map{|f| f.update(is_purchase: false)}
	 		flash[:success] = 'お買い上げありがとうございました。'
	 		redirect_to items_path
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

