class CommentsController < ApplicationController

  load_resource only: [:edit, :update, :destroy]
  authorize_resource only: [:edit, :update, :destroy]

   def create
     @article = Article.find_by_id(params[:article_id])
     #@article.comments << Comment.new(comments_params)
     #@article.comments.last.user_id = current_user.id
     @comment = @article.comments.create(comments_params)
     @comment.update_attributes(user_id: current_user.id)
     if @comment.new_record?
       flash[:error] = "Comment can't be blank"
     else
       flash[:notice] = "New comment has been just added"
     end
     redirect_to article_path(@article)
   end

   def update
     if @comment.update_attributes(comments_params)
       redirect_to article_path(@comment.article)
     else
       flash[:error] = "Content field can't be blank!"
       render :edit
     end
   end

   def destroy
     @comment.destroy
     redirect_to article_path(@comment.article)
   end

   private

   def comments_params
	  params.require(:comment).permit(:content)
   end

end
