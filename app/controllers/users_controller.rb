class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create

    @email    = params[:email]
    @password = params[:password]

    @user = User.authenticate_create(@email,@password)

    p "------------------------------------------"
    p @user
    p " THIS IS THE SIGNUP SECTION"

    if @user
      session[:user_id] = @user.id
      session[:logged_in] = true
      redirect_to user_courses_path(@user)
    else
      @signin_error = "Try again"
      flash[:error] = 'Authentication failed: Your Email and/or Password is Incorrect'
      redirect_to root_path
    end
  end
end

