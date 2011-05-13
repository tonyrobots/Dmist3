class HomeController < ApplicationController
  def index
    @dreams = Dream.where(:visible => TRUE, :private => FALSE)
  end
  
end
