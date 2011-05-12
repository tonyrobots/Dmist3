class TagsController < ApplicationController
  def create
    @dream = Dream.find(params[:dream_id])
    tags = params[:name].split(",").each {|t| t.strip!}
    tags.each do |tag|
      tag =  ActionController::Base.helpers.strip_tags(tag)
      @dream.tag_list.add(tag.downcase)
    end
    @dream.save
    redirect_to @dream
  end
  
  def show
    @tag = params[:id]
    @dreams = Dream.tagged_with(@tag)
  end

  def destroy
  end

end
