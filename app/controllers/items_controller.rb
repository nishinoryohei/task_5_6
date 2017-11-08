class ItemsController < ApplicationController
	before_action :authenticate_user!,only:[:new]
	before_action :set_item, only:[:show,:ediy,:update,:destroy]
	def new
		@item = Item.new
		4.times{@item.thumbnails.build}
	end
	def create
		@item = Item.new(item_params)
		@item.user_id = current_user.id
		if @item.save
			redirect_to items_path
		else
			render :new
		end
	end
	def index
		@items = Item.page(params[:page])
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
		params.require(:item).permit(:name,:description,:price,:user_id,
									thumbnails_attributes: [:image])
	end
end
