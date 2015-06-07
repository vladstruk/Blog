class ArticlesController < ApplicationController
	
    before_filter :find_article, only: [:show, :edit, :update, :destroy]

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

	def update
	  if @article.update_attributes(articles_params)
	  	flash[:notice] = "Article #{@article.title} has been just edited."
	  	redirect_to articles_path
	  else
	  	flash[:error] = "None of article fields can be blank!"
	  	render :edit
	  end
	end

	def destroy
       @article.destroy
       flash[:notice] = "Article #{@article.title} has been just deleted."
       redirect_to articles_path
	end


	private

	def articles_params
	  params.require(:article).permit(:id, :title, :content)
	end

	def find_article
	  @article = Article.find_by_id(params[:id])
	end
end
