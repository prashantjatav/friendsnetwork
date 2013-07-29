class FriendsController < ApplicationController

before_filter :login_required, :except => [:index, :show]

def index
@user = User.find(params[:user_id])
end

def show
redirect_to user_friend_path(params[:id])
end

def new
@friendlist1 = Friendlist.new
@friendlist2 = Friendlist.new
end

def create
@user = User.find(current_user)
@friend = User.find(params[:friend_id])
params[:friendlist1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 'requested'}
params[:friendlist2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'pending'}
@friendlist1 = Friendlist.create(params[:friendlist1])
@friendlist2 = Friendlist.create(params[:friendlist2])
if @friendlist1.save && @friendlist2.save
redirect_to user_friends_path(current_user)
else
redirect_to user_friend_path(current_user)
end
end

def update
@user = User.find(current_user)
@friend = User.find(params[:id])
params[:friendlist1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 'accepted'}
params[:friendlist2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'accepted'}
@friendlist1 = Friendlist.find_by_user_id_and_friend_id(@user.id, @friend.id)
@friendlist2 = Friendlist.find_by_user_id_and_friend_id(@friend.id, @user.id)
if @friendlist1.update_attributes(params[:friendlist1]) && @friendlist2.update_attributes(params[:friendlist2])
flash[:notice] = 'Friend sucessfully accepted!'
redirect_to user_friends_path(current_user)
else
redirect_to user_friend_path(current_user)
end
end

def destroy
@user = User.find(params[:user_id])
@friend = User.find(params[:id])
@friendlist1 = @user.friendlists.find_by_friend_id(params[:id]).destroy
@friendship2 = @friend.friendlists.find_by_user_id(params[:id]).destroy
redirect_to user_friends_path(:user_id => current_user)
end

end
