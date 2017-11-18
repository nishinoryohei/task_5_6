class CartsController < ApplicationController
		before_action :authenticate_user!
	def create
		@cart = Cart.new(cart_params)
		@item = Item.find(params[:item_id])
		@cart.item_id = @item.id
		@cart.user_id = current_user.id
		if @cart.save
			item_pick
			redirect_to items_path
		else
			redirect_to items_path
		end
	end
	def update
		@item = Item.find(params[:item_id])
		@cart = Cart.find_by(item_id: @item)
		item_back
		@cart.update(cart_params)
		item_pick
		redirect_to items_path
	end
	def destroy
		@cart = current_user.carts.find_by(item_id: params[:item_id])
		@item = Item.find(params[:item_id])
		item_back
		@cart.destroy
		redirect_to cart_user_path(current_user.id)
	end
	private
	def cart_params
			params.require(:cart).permit(:user_id,:item_id,:quantity)
	end
	 def item_pick
	 	@item.backyard.update(stock: @item.backyard.stock - @cart.quantity)
	 end
	 def item_back
	 	@item.backyard.update(stock: @item.backyard.stock + @cart.quantity)
	 end
end

