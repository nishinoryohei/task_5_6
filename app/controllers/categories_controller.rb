class CategoriesController < ApplicationController
	def category
		@category = Category.where( area: params[:area]).page(params[:page]).per(15).includes(item: [:thumbnails,:backyard])
	end
end
