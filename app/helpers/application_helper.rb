module ApplicationHelper

  def current_course
    if session[:logged_in]
      @current_course ||= Course.find(session[:course_id])
      return @current_course
    else
      nil
    end
  end

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
    if session[:logged_in] && session[:user_id] != nil
      @current_user = User.find(session[:user_id])
      return @current_user
    else
      return nil
    end
  end

  def destroy_session
    session[:user_id] = nil
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

end
