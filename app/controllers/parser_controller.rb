class ParserController < ApplicationController
  def index
    @courses = Course.all
  end

  def import
    @class_list = params[:file]



    redirect_to root_path, notice: "Class Imported!"
  end
end
