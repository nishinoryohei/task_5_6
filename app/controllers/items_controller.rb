class ItemsController < ApplicationController
	before_action :authenticate_user!,only:[:new,:edit,:update,:destroy]
	before_action :set_item, only:[:show,:edit,:update,:destroy]
	before_action :exhibitor_only, only:[:new,:edit,:update,:destroy]
	before_action :correct_user, only:[:edit,:update]
	def new
		@item = Item.new
		4.times{@item.thumbnails.build}
		@item.build_backyard
		add_breadcrumb '出品'
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
		@items = Item.page(params[:page]).per(15).includes(:thumbnails,:backyard)
		# binding pry
		unless params[:price].nil?
			price = params[:price].to_i
			@items = @items.get_by_price price
		end
	end
	def show
		@cart = Cart.new
		add_breadcrumb @item.name, :item_path
	end
	def edit
	end
	def update
		if @item.update(item_params)
			redirect_to item_path(@item)
		else
			render :edit
		end
	end
	def destroy
		@item.destroy
		redirect_to items_path
	end
	private
	def set_item
		@item = Item.find(params[:id])
	end
	def item_params
		params.require(:item).permit(:name,:description,:price,:user_id,								
			thumbnails_attributes: [:image],
			backyard_attributes: [:stock])
	end
	def correct_user
		item = Item.find(params[:id])
		if current_user.id != item.user_id
			redirect_to items_path
		end
	end

end
