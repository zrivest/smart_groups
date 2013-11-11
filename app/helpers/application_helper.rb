module ApplicationHelper

  def current_user
    if session[:logged_in]
      @current_user || User.find(session[:user_id])
    else
      nil
    end
  end

  def current_course
    if session[:logged_in]
      @current_course || Course.find(session[:course_id])
    end
    nil
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


  # def current_students_from_course(course_id)
  #   students = Course.find(course_id).students
  #   students.uniq{ |student| student.id }
  # end






end
