class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!
  #this is for the prefinery invite screen
  #before_filter :check_invite_code
  
  protected
  
  def check_invite_code
    unless params[:controller] == "devise/registrations" || params[:controller] == "devise/sessions" 
      if current_user
        if !current_user.invite_code #|| current_user.is_admin?
          redirect_to "/splash"
        end
      else redirect_to "/splash"
      end
  end
  end
  
end
