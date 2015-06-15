class ArticleCategoriesController < ApplicationController

  authorize_resource only: [:create]

  def create
  	article = Article.find_by_id(params[:article_id])
  	category = Category.find_by_name(params[:article_category][:category])
  	if article && category
  	  article_category = article.article_categories.build(article: article, category: category)
      if article_category.save
        flash[:notice] = "New category to article #{article.title} added."
      else
        flash[:error] = "Something went wrong."
      end
    else
      flash[:error] = "Something went wrong."
    end
    redirect_to article_path(article)
  end

end
