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
end
