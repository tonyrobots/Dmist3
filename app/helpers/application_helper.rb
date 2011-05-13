# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def getUsernameById(id)
    @user = User.find_by_id(id)
    @user.username
  end
  def getUsernameLinkById(id)
    @user = User.find_by_id(id)
    link_to @user.username, @user
  end
  
  def current_user_is?(id)
     if user_signed_in?
       current_user.id == id
     end
   end

  def dreamDate(dream)
    if dream.date
      dream.date.strftime("%A, %B %d, %Y")
    else
      dream.created_at.strftime("%A, %B %d, %Y")
    end
  end
  
  def avatar_thumb_linked(user_id)
    user = User.find(user_id)
    html = ""
    avatar_etc = (image_tag (user.avatar.url)) +  (content_tag :br, user.username)
    html += link_to (avatar_etc), user_path(user_id)
    return html.html_safe
  end
  
  
end
