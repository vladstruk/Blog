class RatingsController < ApplicationController

  def create
  	if @article = Article.find_by_id(params[:article_id])
  		@rating = @article.ratings.build(user: current_user, vote: true)
  		if @rating.save
  			flash[:notice] = "You up rating"
  		else
        flash[:error] = "You can't up rating"
    	end
      redirect_to articles_path
    else
      render_404
    end
  end

end