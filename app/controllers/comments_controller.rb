class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @commentable = params[:comment][:commentable_type].constantize.find(params[:comment][:commentable_id])
    
    respond_to do |format|
      if @comment.save
        flash[:notice] = "Thanks for commenting!"
        format.html { redirect_to(request.referer)}
        format.js
      else
        flash[:notice] = "Sorry, comment couldn't be saved."
        format.html { redirect_to(request.referer, :notice => 'Comment failed to save.') }
        format.js
      end
    end
    
  end
  
  def destroy
  end
  
end
