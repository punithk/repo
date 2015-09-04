class PhotosController < ApplicationController
def index
  @photos = Photo.where(:user_id => params[:user_id])
  respond_to do |format|
    format.html 
    format.json { render json: @photos }
  end
end
def show
  @photo = Photo.find(params[:id])
  respond_to do |format|
    format.html 
    format.json { render json: @photo }
  end
end
def new
  @photo = Photo.new
  respond_to do |format|
    format.html
    format.json { render json: @photo }
  end
end
def edit
  @photo = Photo.find(params[:id])
end
def create
  @photo = Photo.new(params[:photo])
  path1 = @photo.saving(params[:photo] )
  respond_to do |format|
    if @photo.save
      format.html { redirect_to users_path+"/"+@photo.user_id.to_s+"/photos/"+@photo.id.to_s, notice: 'Photo was successfully created.' }
      format.json { render json: users_path+"/"+@photo.user_id.to_s+"/photos/"+@photo.id.to_s, status: :created, location: @photo }
      path =  File.join( "public/data", @photo.id.to_s+@photo.url) 
      File.rename(path1 , path)
    else
      format.html { redirect_to users_path+"/"+@photo.user_id.to_s+"/photos/new", notice: 'NO PHOTO SELECETED!!!' }
        #format.html { render action: "new" }
      format.json { render json: @photo.errors, status: :unprocessable_entity }
    end
  end
end
def update
  @photo = Photo.find(params[:id])
  respond_to do |format|
    if @photo.update_attributes(params[:photo])
      format.html { redirect_to users_path+"/"+@photo.user_id.to_s+"/photos/"+@photo.id.to_s, notice: 'Photo was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @photo.errors, status: :unprocessable_entity }
    end
  end
end
def destroy
  @photo = Photo.find(params[:id])
  id = @photo.user_id
  @photo.destroy
  path =  File.join( "public/data", @photo.id.to_s+@photo.url) 
  File.delete(path)
  respond_to do |format|
    format.html { redirect_to users_path+"/"+id.to_s+"/photos" }
    format.json { head :no_content }
  end
end
end
