module ApplicationHelper



  def current_user
    if session[:logged_in]
      @current_user || User.find_by_id(session[:user_id])
    else
      nil
    end
  end

  def destroy_session
    session[:user_id] = nil
    session[:logged_in] = false
    redirect_to root_path
  end

  def find_user(email)
    user = User.find_by_email(email)
    if user
      user
    else
      nil
    end
  end


  def authenticated?
    !current_user.nil?
  end

  def logged_in?
    if session[:logged_in]
      return true
    else
      return false
    end
  end

  def session_fail
    if logged_in?
      false
    else
      @login_error = "You have been logged out."
    end
  end
end
