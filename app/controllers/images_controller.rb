class ImagesController < ApplicationController
 def create
    @user = User.find(params[:user_id])
    @image = @user.images.create(params[:image])
    redirect_to user_path(@user)
  end

end
