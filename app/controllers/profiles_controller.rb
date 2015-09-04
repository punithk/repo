class ProfilesController < ApplicationController
def index
  @profiles = Profile.where(:user_id => params[:user_id])
  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @profiles }
  end
end
def show
  @profile = Profile.find(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @profile }
  end
end
def new
  @profile = Profile.new
    #@profile.user_id = params[:user_id].to_i
  respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @profile }
  end
end
def edit
  @profile = Profile.find(params[:id])
end
def create
  @profile = Profile.new(params[:profile])
  pro = Profile.where(:user_id => @profile.user_id).last
  respond_to do |format|
   if pro.nil? != true
     format.html { redirect_to users_path+"/"+pro.user_id.to_s+"/profiles/"+pro.id.to_s, notice: 'Profile already exists for this user id!!!' }
     format.json { render json: @profile.errors, status: :unprocessable_entity }
     @profile.destroy
  elsif @profile.save
     format.html { redirect_to users_path+"/"+@profile.user_id.to_s+"/profiles/"+@profile.id.to_s, notice: 'Profile was successfully created.' }
     format.json { render json: users_path+"/"+@profile.user_id.to_s+"/profiles/"+@profile.id.to_s, status: :created, location: users_path+"/"+params[:user_id]+"/profiles/"+@profile.id.to_s }
   else
     format.html { redirect_to users_path+"/"+@profile.user_id.to_s+"/profiles/new" , notice: 'ALL FIELDS MUST BE FILLED!!!' }
     format.json { render json: @profile.errors, status: :unprocessable_entity }
    end
  end
end
def update
  @profile = Profile.find(params[:id])
  respond_to do |format|
    if @profile.update_attributes(params[:profile])
      format.html { redirect_to users_path+"/"+@profile.user_id.to_s+"/profiles/"+@profile.id.to_s, notice: 'Profile was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { redirect_to users_path+"/"+@profile.user_id.to_s+"/profiles/"+@profile.id.to_s+"/edit" , notice: 'ALL FIELDS MUST BE FILLED!!!' }
        #format.html { render action: "edit" }
      format.json { render json: @profile.errors, status: :unprocessable_entity }
    end
  end
end
def destroy
  @profile = Profile.find(params[:id])
  uid = @profile.user_id
  @profile.destroy
  respond_to do |format|
    format.html { redirect_to users_path+"/"+uid.to_s+"/profiles" }
    format.json { head :no_content }
  end
end
end
