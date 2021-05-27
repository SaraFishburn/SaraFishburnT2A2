module ApplicationHelper
  # store the profile pic of a user as a variable so its only called from the database once
  def current_user_profile_pic
    @current_user_profile_pic ||= current_user.profile_pic
  end
  
  # store the chatrooms of a user as a variable so they're only called from the database once
  def current_user_chatrooms
    @current_user_chatrooms ||= current_user.chatrooms
  end

  def printer_types
    %w[FDM SLA]
  end
end
