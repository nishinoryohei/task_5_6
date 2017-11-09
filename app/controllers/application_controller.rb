class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb 'トップページ', :items_path
  	def exhibitor_only
		if current_user.exhibitor == false
			redirect_to items_path
		end
	end
end
