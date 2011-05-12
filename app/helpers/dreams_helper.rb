module DreamsHelper
  def show_tags(dream)
    dream.tag_list * ", " 
  end
end
