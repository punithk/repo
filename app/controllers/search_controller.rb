class SearchController < ApplicationController

  def index
    @users = User.where("fname LIKE ? OR lname LIKE ?" , "%#{params[:q]}%" , "%#{params[:q]}%")
    respond_to do |format|
      format.html 
      format.json { render json: @users }
    end
  end
end
