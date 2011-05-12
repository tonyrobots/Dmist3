class TagsController < ApplicationController
  def create
    @dream = Dream.find(params[:dream_id])
    @dream.tag_list.add(params[:name])
    @dream.save
    redirect_to @dream
  end

  def destroy
  end

end
