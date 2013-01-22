# app/controllers/static_controller.rb
class StaticController < ApplicationController
  #layout 'plain'
  skip_before_filter :check_invite_code
  

  caches_page :show

  def show
    #some page-specific bits
    case params[:path]
    when "about"
      @title = "Dreamerist FAQ"
    when "splash"
      layout = 'plain'
    end    
    
    valid = %w(splash about)
    if valid.include?(params[:path])
      render :template => File.join('static', params[:path]), :layout => layout || 'application'
    else
      render :file   => File.join(Rails.root, 'public', '404.html'), 
             :status => 404
    end
  end
end
