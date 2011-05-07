class UsersController < ApplicationController
  def show
    @commentable = @user = User.find(params[:id])
    @dreams = @user.dreams
  end
end
