class PdfController < ApplicationController

  def index
  end

  def import
    user = User.find(session[:user_id])
    course = user.courses.create!(name: params[:course_title])

    file = params[:file]

    pdf_parser = Pdf.import(file, course)
    @raw_content = []

    @raw_content << pdf_parser.pages.last.raw_content

    binding.pry
    redirect_to user_courses_path(session[:user_id])
  end

end
