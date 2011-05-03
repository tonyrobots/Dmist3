class HomeController < ApplicationController
  def index
    @dreams = Dream.order("created_at DESC")
  end
  
end
