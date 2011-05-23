class HomeController < ApplicationController
  def index
    @dreams = Dream.where(:visible => TRUE, :private => FALSE).limit(5)
    # TODO add featured dream logic
    @featured_dream = Dream.first
  end
  
end
