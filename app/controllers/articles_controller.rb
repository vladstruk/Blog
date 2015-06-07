class ArticlesController < ApplicationController
	def index
      @articles = Article.all
	end

	def new
	  @article = Article.new
	end

	def create
	  @article =  Article.new(articles_params)
	  if @article.save
	  	flash[:notice] = "New article added."
	  	redirect_to articles_path
	  else
	  	flash[:error] = "None of article fields can be blank!"
	  	render :new
	  end
	end

	def edit
	  @article = Article.find_by_id(params[:id])
	end

	def update
	  @article = Article.find_by_id(params[:id])
	  if @article.update_attributes(articles_params)
	  	flash[:notice] = "Article #{@article.title} has been just edited."
	  	redirect_to articles_path
	  else
	  	flash[:error] = "None of article fields can be blank!"
	  	render :edit
	  end
	end


	private

	def articles_params
	  params.require(:article).permit(:id, :title, :content)
	end
end
