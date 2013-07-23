class UsersController < ApplicationController
  
  def new
  @user = User.new
  @user.build_address
  end
  
  def index
  
  end
  
  
  def create
   @user =  User.includes(:profile).where(:id => params[:user_id]).first
   @user.profile.save!
  end
  
  def update
  @user =  User.includes(:profile).where(:id => params[:user_id]).first
  redirect_to user_profile_path(:user_id => current_user.id, :id => current_user.id)
  #redirect_to user_profile_path(:user_id => current_user.id, :id => current_user.id)
  end
  
  def show
  @user = User.find(params[:id])
  end
end
