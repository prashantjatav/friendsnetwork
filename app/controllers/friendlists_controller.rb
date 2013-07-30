class FriendlistsController < ApplicationController


  def new
   @friendlist1 = Friendlist.new

  end
  
  def index
  @users = User.all
  end
  
  def show
   
  end
  
  def search_user
     @friends = Friendlist.where(":user_id=>current_user.id OR :friend_id=>current_user.id")
     @users = User.where("email LIKE '%#{params[:name]}%'").limit(10)
     #@users = Friendlist.where.not("user_id=27 AND friend_id=current_user.id AND email LIKE '%#{params[:name]}%'")
      render :partial => 'search_user'
  end
  
  def add_friend
     @user = current_user.id
     @friend = params[:friend_id]
     params[:friendlist] = {:user_id => @friend, :friend_id => @user, :status => 'pending'}
     @friendlist1 = Friendlist.create(params[:friendlist])
     if @friendlist1.save
       render :partial => 'search_user'
       
     else
       render :partial => 'search_user'
     end
    
  end
  
  def check
  
  end
  
end
