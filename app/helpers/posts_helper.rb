module PostsHelper
  def user_is_authorized_as_admin_or_current_user?(post)
        current_user && (current_user == post.user || current_user.admin?)
   end

   def user_is_authorized_as_mod?(post)
         current_user.moderator?
    end
end
