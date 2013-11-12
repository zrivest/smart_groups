class ApplicationController < ActionController::Base
  include ApplicationHelper
  include MetricsHelper
  protect_from_forgery

  before_filter :session_expire
  before_filter :update_activity_time

  def session_expire
    session_time_left
    unless @session_time_left > 0
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
    @session_time_left = (expire_time - Time.now).to_i
  end

helper :all
end

