class ParserController < ApplicationController
  require 'smarter_csv'

  def index

  end

  def import
    Course.create(name: params[:course_title])
    file = params[:file]
    Parser.import(file)

    redirect_to root_path
  end
end
