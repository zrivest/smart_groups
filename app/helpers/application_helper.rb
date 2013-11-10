module ApplicationHelper


  def logged_in?
    if session[:logged_in]
      return true
    else
      return false
    end
  end

  def session_fail
    unless logged_in?
      flash[:notice] = "Error: User not logged in, invalid email and/or password."
      redirect_to root_path
    end
  end

  def current_user
    if session[:logged_in]
      @current_user || User.find_by_id(session[:user_id])
    else
      nil
    end
  end

  def destroy_session
    session.clear
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end

  def find_user(email)
    user = User.find_by_email(email)
    if user.nil?
      return false
    else
      return user
    end
  end


  def authenticated?
    !current_user.nil?
  end

end
