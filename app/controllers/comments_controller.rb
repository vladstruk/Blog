class CommentsController < ApplicationController

   def create
   	 @article = Article.find_by_id(params[:article_id])
   	 @comment = @article.comments.create(comments_params)
   	 if @comment.save
   	   flash[:notice] = "New comment has been just added"
   	 else
   	   flash[:error] = "Comment can't be blank"
   	 end
   	 redirect_to article_path(@article)
   end

   private

   def comments_params
	  params.require(:comment).permit(:content)
	end

end
