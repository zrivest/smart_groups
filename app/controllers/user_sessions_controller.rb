class UserSessionsController < ApplicationController

def login
    email    = params[:email]
    user_password = params[:password]

    user = find_user(email)

    if user
      @user = user.authenticate(user_password)
    end

    # remove deubbing code
    p "-=---------------------------"
    p @user


    if @user
      session[:user_id] = @user.id
      session[:logged_in] = true
      redirect_to user_courses_path(@user)
    else
      @login_error = "Try again"
      session.clear
      flash[:error] = 'Authentication failed: Your Email and/or Password is Incorrect'
      redirect_to root_path
    end
  end


  def logout
    if session[:logged_in]
      flash[:notice] = "You have successfully logged out."
      destroy_session
    else
      session[:logged_in] = false
      session[:user_id] = nil
      redirect_to root_path
    end
  end
end
