class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        #@comment = Comment.new
        # UGH -- this won't work for users....where is my polymorphism?!?! TODO
        @commentable = @dream = Dream.find(params[:comment][:commentable_id])
        flash[:notice] = "Thanks for commenting!"
        format.html { redirect_to(request.referer, :notice => 'Thanks for commenting!') }
        format.js
      else
        format.html { redirect_to(request.referer, :notice => 'Comment failed to save.') }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def destroy
  end
  
end
