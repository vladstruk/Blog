class CommentsController < ApplicationController

	before_filter :find_comment, only: [:edit, :update]

   def create
   	 @article = Article.find_by_id(params[:article_id])
   	 @comment = @article.comments.create(comments_params)
   	 if @comment.new_record?
   	   flash[:error] = "Comment can't be blank"
   	 else
   	   flash[:notice] = "New comment has been just added"
   	 end
   	 redirect_to article_path(@article)
   end

   def update
   	 if @comment.update_attributes(comments_params)
   	   flash[:notice] = "Comment has been just edited."
   	   redirect_to article_path(@comment.article)
   	 else
   	   flash[:error] = "Content field can't be blank!"
   	   render :edit
   	 end
   end

   private

   def comments_params
	  params.require(:comment).permit(:content)
   end

   def find_comment
   	  @comment = Comment.find_by_id(params[:id])
   end

end
