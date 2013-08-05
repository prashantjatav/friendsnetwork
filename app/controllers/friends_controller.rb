class FriendsController < ApplicationController

#before_filter :login_required, :except => [:index, :show]

def index
 @user = User.find(params[:user_id])
 @current_friends = Friendlist.current_friends(current_user.id)
 @pending_requests = Friendlist.pending_requests(current_user.id)
 @requested_friends = Friendlist.requested_friends(current_user.id)
end

def show
redirect_to user_friend_path(params[:id])
end

def new

end

def create

end

def update

end

def destroy

end

end
