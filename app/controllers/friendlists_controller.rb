class FriendlistsController < ApplicationController


  def new
   @friendlist1 = Friendlist.new
   @friendlist2 = Friendlist.new

  end
  
  def index
  #@users = User.all
  end
  
  def show
   
  end
  
  def search_user
     @users = User.where("email LIKE '%#{params[:name]}%'").limit(10)
      render :partial => 'search_user'
  end
  
  def add_friend
     @friend = User.find(params[:friend_id])
     @friendlist1 = Friendlist.new(:user_id => current_user.id, :friend_id => @friend.id, :status => 'requested') if @friend
     @friendlist2 = Friendlist.new(:user_id => @friend.id, :friend_id => current_user.id, :status => 'pending') if @friend
     if(@friendlist1.save and @friendlist2.save)
      render :text => "Friend request sucessfully sent!"
     else
      render :text => "Friend request not sent!"
     end
  end
  
  def update
   @friend = User.find(params[:id])
   params[:friendlist1] = {:user_id => current_user.id, :friend_id => @friend.id, :status => 'accepted'}
   params[:friendlist2] = {:user_id => @friend.id, :friend_id => current_user.id, :status => 'accepted'}
   @friendlist1 = Friendlist.find_by_user_id_and_friend_id(current_user.id, @friend.id)
   @friendlist2 = Friendlist.find_by_user_id_and_friend_id(@friend.id, current_user.id)
   if @friendlist1.update_attributes(params[:friendlist1]) && @friendlist2.update_attributes(params[:friendlist2])
    flash[:notice] = 'Friend sucessfully accepted!'
    redirect_to user_friends_path(current_user)
   else
    redirect_to user_friend_path(current_user)
   end
  end
  
  def destroy
   @friend = User.find(params[:id])
   @friendlist1 = Friendlist.find_by_user_id_and_friend_id(params[:id], current_user.id).destroy
   @friendlist2 = Friendlist.find_by_user_id_and_friend_id(current_user.id, params[:id]).destroy
   redirect_to user_friends_path(:user_id => current_user)
  end
  
  def check

  end
end
