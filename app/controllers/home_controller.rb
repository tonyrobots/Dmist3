class HomeController < ApplicationController
  def index
    @dreams = Dream.where(:visible => TRUE, :private => FALSE).limit(5)
  end
  
end
