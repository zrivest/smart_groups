class ParserController < ApplicationController
  require 'smarter_csv'

  def index
  end

  def import
    user = User.find(session[:user_id])

    course = user.courses.create!(name: params[:course_title])

    file = params[:file]
    Parser.import(file, course)

    redirect_to user_courses_path(session[:user_id])
  end
end
