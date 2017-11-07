class ItemsController < ApplicationController
	before_action :set_item, only:[:show,:ediy,:update,:destroy
	def new
		@item = Item.new
	end
	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to item_path
		else
			render :new
		end
	end
	def index
		@items = Item.all
	end
	def show
	end
	def edit
	end
	def update
	end
	def destroy
	end
	private
	def set_item
		@item = Item.find(params[:id])
	end
	def item_params
		params.require(:item).permit(:name,:description,:price,:user_id)
	end
end
