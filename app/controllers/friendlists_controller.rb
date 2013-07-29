class FriendlistsController < ApplicationController


  def new
  end
  
  def index
  @users = User.all
  end
  
  def show
   
  end
  
  def search_user
    #@users = User.where(:id => current_user.id)
     @users = User.where("email LIKE '%#{params[:name]}%'").limit(10)
      render :partial => 'search_user'

  end


  
end
