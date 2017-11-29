class UsersController < ApplicationController
	before_action :set_user
	before_action :authenticate_user!
	before_action :correct_user
	def show
		add_breadcrumb @user.name
	end
	def edit
		
	end
	def update
		
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
end
