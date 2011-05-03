class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dreams = @user.dreams
  end
end
