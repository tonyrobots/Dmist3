class DreamsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end
  
  def index
    @dreams = Dream.all
  end
  
  def show
    @dream = Dream.find(params[:id])
  end
  
end
