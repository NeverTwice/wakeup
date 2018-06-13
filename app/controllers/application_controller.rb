class ApplicationController < ActionController::Base

  def after_sign_in_path_for resource
    if resource.is_a?(User)
      # Redirections for bakers
      bakery = Bakery.where(:user_id => resource.id).first
      if bakery
        bakery
      else
        "/bakeries/new"
      end
    else
      super
    end
  end

end