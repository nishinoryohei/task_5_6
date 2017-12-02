class CartsController < ApplicationController
		before_action :set_item, only:[:create,:update,:destroy]
		before_action :authenticate_user!
	def create
		@cart = Cart.new(cart_params)
		@cart.item_id = @item.id
		@cart.user_id = current_user.id
		unless item_pick == false
		 	if @cart.save
		 		redirect_to items_path
		 	else
		 		redirect_to item_path(@item)
		 	end
		 else
		 	redirect_to items_path
		end
	end
	 def show
	 	@cart = Cart.where(user_id: current_user.id)
	 	unless current_user.personal.present?
	 		@personal = Personal.new
	 	else
	 		@personal = Personal.find_by(user_id: current_user)
	 	end
	 end
	def update
		@cart = Cart.find_by(item_id: @item)
		item_back
		@cart.update(cart_params)
		item_pick
		redirect_to items_path
	end
	def destroy
		@cart = current_user.carts.find_by(item_id: params[:item_id])
		item_back
		@cart.destroy
		redirect_to user_cart_path(current_user.id)
	end
	private
	def set_item
		@item = Item.find(params[:item_id])
	end
	def cart_params
		params.require(:cart).permit(:user_id,:item_id,:quantity,:is_purchase)
	end
	 def item_pick
	 	@item.backyard.update(stock: @item.backyard.stock - @cart.quantity)
	 end
	 def item_back
	 	@item.backyard.update(stock: @item.backyard.stock + @cart.quantity)
	 end
end

