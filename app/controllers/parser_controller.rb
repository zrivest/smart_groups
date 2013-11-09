class ParserController < ApplicationController

  def index

  end

  def import
    binding.pry
    @assignment = params[:file]

    redirect_to root_path, notice: "Class Imported!"
  end
end
