class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  helper :all # does this work? i thought it was deprecated in rails 3.2.x

  before_filter :session_expire, :update_activity_time

  def session_expire
    unless session_time_left > 0
      session.clear
      flash[:notice] ='Your session has timed out. Please log back in.'
    end
  end

  def update_activity_time
    session[:expires_at] = 60.minutes.from_now
  end

  private

  def session_time_left
    expire_time = session[:expires_at] || Time.now
    return (expire_time - Time.now).to_i
  end

end

