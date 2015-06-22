class RatingsController < ApplicationController

  def create
  	if @article = Article.find_by_id(params[:article_id])
  		@rating = @article.ratings.find_or_initialize_by(user: current_user)
  		if @rating.update_attributes vote: params[:vote]
  			flash[:notice] = "You change rating"
  		else
        flash[:error] = "You can't change rating"
    	end
      redirect_to articles_path
    else
      render_404
    end
  end

  def destroy
  	if @article = Article.find_by_id(params[:article_id])
  		@article.ratings.where(user: current_user).delete_all
  		redirect_to articles_path
    else
      render_404
    end
  end

  #def ratings_params
  #  params.require(:rating).permit(:article_id, :user_id, :vote)
  #end

end