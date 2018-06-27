module ApplicationHelper

  def user_redirection resource
    if resource.is_a?(User)
      if current_user.baker?
        # Redirections for bakers
        bakery = Bakery.where(:user_id => resource.id).first
        if bakery
          bakery
        else
          "/bakeries/new"
        end
      else
        # Redirections for users
        "/bakeries"
      end
    else
      "/bakeries"
    end
  end

end
