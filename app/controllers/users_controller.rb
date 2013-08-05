class UsersController < ApplicationController
   
  def index
  end
  
  def edit
  @user = User.find(params[:id])
  end
  
  def create
    
  end
  
  def update
   
   @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
    redirect_to user_path(:id => current_user.id)
    flash[:success] = "Profile updated"
   end
  end
  
  def show
  @user = User.find(params[:id])
  end
  
end
