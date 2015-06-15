class Admin::CategoriesController < ApplicationController

	authorize_resource only: [:index, :create]

	def index
      @category = Category.new
	  @categories = Category.all
	end

	def create
	  @category = Category.new(categories_params)
	  if @category.save
	  	redirect_to admin_categories_path
	  else
	  	flash[:error] = "Category with such name already exists!"
	  	render :index
	  end
	end

	private

	def categories_params
	  params.require(:category).permit(:name)
	end

end
