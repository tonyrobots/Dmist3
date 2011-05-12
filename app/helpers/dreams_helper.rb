module DreamsHelper
  def show_tags(tag_list)
    linked_tags = []
    for tag in tag_list
      linked_tags.push link_to tag.html_safe, tag_path(tag)
    end
    return linked_tags * ', '
  end
end
