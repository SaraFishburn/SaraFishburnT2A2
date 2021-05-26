module ApplicationHelper
  def current_user_profile_pic
    @current_user_profile_pic ||= current_user.profile_pic
  end

  def current_user_chatrooms
    @current_user_chatrooms ||= current_user.chatrooms
  end

  def printer_types
    %w[FDM SLA]
  end
end
