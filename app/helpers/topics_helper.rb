module TopicsHelper

  def user_is_authorized_for_topic?
    current_user && current_user.admin?
  end

  def user_is_authorized_as_admin_or_mod_current_user?
       current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
  end

 def user_is_authorized_as_mod?
    current_user.moderator?
  end

  def user_is_authorized_as_mod_or_admin?
    current_user.admin? || current_user.moderator?
  end

end
