class DreamsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :destroy, :addComment]
  
  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(params[:dream])
    @dream.user_id = current_user.id
    
    if @dream.save
      flash[:notice] = "Dream created."
      redirect_to(@dream)
    else
      render :action => "new"
    end
  end

  def edit
    @dream = Dream.find(params[:id])
    unless current_user.id == @dream.user_id
      flash[:alert] = "You can't edit someone else's dream."
      redirect_to(@dream)
    end
  end

  def update
    @dream = Dream.find(params[:id])
    if @dream.update_attributes(params[:dream])
      flash[:notice] = "Dream updated."
      redirect_to(@dream)
    else
      render :action => "update"
    end
  end
  
  def index
    # not used?
    @dreams = Dream.where(:visible => TRUE, :private => FALSE)
  end
  
  def show
    @commentable = @dream = Dream.find(params[:id])
    @comments = @dream.comments.all
    @comment = Comment.new
    @dream_tag = @dream.tags.build
  end
  
  def destroy
     @dream = Dream.find(params[:id]) 
     if current_user.id == @dream.user_id
       @dream.visible = FALSE
       @dream.save
       flash[:notice] = "\"" + @dream.title + "\" removed."
       redirect_to request.referrer
     else
       flash[:notice] = "Delete failed. You have no right to go around stomping on other people's dreams."
       redirect_to request.referrer
     end
  end
   
  def add_tag
     @dream = Dream.find(params[:id])
     @dream.tag_list.add(params[:name])
     @dream.save
  end
end
