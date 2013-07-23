class ProfilesController < ApplicationController
  def create
   
  end 
  
  def index
   #@profile = Profile.all
  end
  
  def show
   @user =  User.includes(:profile).where(:id => params[:user_id]).first
   #@user = User.includes(:profile).where(:user_id => current_user.id)
  end
  
  def edit
    @user =  User.includes(:profile).where(:id => params[:user_id]).first
  end
  
  def update
  
  end
  
end
