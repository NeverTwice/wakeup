class ApplicationController < ActionController::Base
  include ApplicationHelper

  def after_sign_in_path_for resource
    user_redirection resource
  end

  def after_sign_up_path_for resource
    user_redirection resource
  end

end