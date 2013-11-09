class ParserController < ApplicationController
  require 'smarter_csv'

  def index

  end

  def import
    file = params[:file]

    Parser.import(file)
      # binding.pry
    redirect_to root_path
  end
end
