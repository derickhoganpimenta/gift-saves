class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper_method :current_logged_user

  def require_login
    redirect_to login_path + "?next=" + request.url, notice: "You must be logged to see this page" if not current_logged_user
  end
end
