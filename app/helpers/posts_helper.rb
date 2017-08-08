module PostsHelper
  def user_is_authorized_as_mod_or_admin?(post)
        current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
   end

   def user_is_authorized_as_mod?(post)
         current_user.moderator?
    end
end
