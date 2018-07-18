class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :set_user_bakery

  def set_user_bakery
    if current_user && current_user.baker?
      @mybakery = Bakery.find_by(:user_id => current_user.id)
    end
  end

  def set_current_user
    User.current = current_user
  end

  def after_sign_in_path_for resource
    user_redirection resource
  end

  def after_sign_up_path_for resource
    user_redirection resource
  end

end