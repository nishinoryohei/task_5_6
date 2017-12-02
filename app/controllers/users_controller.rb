class UsersController < ApplicationController
	before_action :set_user
	before_action :authenticate_user!
	before_action :correct_user
	def show
		add_breadcrumb @user.name
	end
	def exhibitor
		@user = User.find(params[:id])
		@items = @user.items.page(params[:page]).per(15).includes(:carts,:thumbnails)
	end
	def edit
		@personal = Personal.find_by(user_id: @user.id)
	end
	def update
		@personal = Personal.find_by(user_id: @user.id)
		if @personal.update(personal_params)
			redirect_to items_path
		else
			render :edit
		end
	end
	private
	def set_user
		@user = User.find(params[:id])
	end
	def correct_user
		user = User.find(params[:id])
		if current_user.id != user.id
			redirect_to items_path
		end
	end
	private
	def personal_params
		params.require(:personal).permit(:email,:tel,:state,:city,:address,:user_id)
	end
end
