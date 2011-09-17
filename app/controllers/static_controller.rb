# app/controllers/static_controller.rb
class StaticController < ApplicationController
  layout 'plain'

  caches_page :show

  def show
    valid = %w(splash)
    if valid.include?(params[:path])
      render :template => File.join('static', params[:path])
    else
      render :file   => File.join(Rails.root, 'public', '404.html'), 
             :status => 404
    end
  end
end