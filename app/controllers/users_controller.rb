class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index, :create, :new]

   # GET /users
   # GET /users.xml
   def index
     @users = User.all

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @users }
     end
   end
  
  def show
    @commentable = @user = User.find(params[:id])
    if @user == current_user
      @dreams = @user.dreams.where(visible:true)
    else
      @dreams = @user.dreams.where(visible:true, private:false)
    end
      
    respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @user }
    end    
  end
  
  def edit
    @user = current_user
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(current_user)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    #TODO maybe -- do we need a destroy action for users? need to make sure it's self or admin only
  end
  
  
end
