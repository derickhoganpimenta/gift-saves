module ApplicationHelper
  def current_logged_user
    @current_logged_user ||= session[:current_logged_user_id] && User.find(session[:current_logged_user_id]) # Use find_by_id to get nil instead of an error if user doesn't exist
  end
end
