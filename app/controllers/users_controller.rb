class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user
	def show
		@user = User.find(params[:id])
		add_breadcrumb @user.name
	end
	def cart
		@user = User.find(params[:id])
	end
	private
	def correct_user
		user = User.find(params[:id])
		if current_user.id != user.id
			redirect_to items_path
		end
	end
end
