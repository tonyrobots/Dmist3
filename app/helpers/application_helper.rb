# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def getUsernameById(id)
    @user = User.find_by_id(id)
    @user.name
  end
  def getUsernameLinkById(id)
    @user = User.find_by_id(id)
    link_to @user.name, profile_path + "/" + @user.login
  end
  
  def currentUserId(current_user)
    current_user ? current_user.id : -1
  end
  
  def paginated?
    @pages and @pages.length > 1
  end
  
  def will_paginate(*)
    #stub
  end

  def dreamDate(dream)
    if dream.date
      dream.date.strftime("%A, %B %d, %Y")
    else
      dream.created_at.strftime("%A, %B %d, %Y")
    end
  end
end
