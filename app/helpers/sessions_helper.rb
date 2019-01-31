module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    current_user.present?
  end
  
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_users_path
    elsif action_name == 'edit'
      user_path
    end
  end
end