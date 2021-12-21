class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  def require_user_logged_in
    unless Current.user
      session[:intended_url] = request.url
      redirect_to signin_url, alert: "Please sign in first"
    end
  end

  def current_user?(user)
    current_user == user
  end

  # def current_user_admin?
  #   current_user && current_user.admin?
  # end

  # def require_admin
  #   unless current_user_admin?
  #     redirect_to root_url, alert: "Unauthorised access!"
  #   end
  # end


end
