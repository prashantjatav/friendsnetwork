module ApplicationHelper

 def check_user(cur,frnd)
    @friendlist1 = Friendlist.new
    @friendlist2 = Friendlist.new
    @user = User.find(cur)
    @friend = User.find(frnd)
    @friendlist1 = Friendlist.find_by_user_id_and_friend_id(@user.id, @friend.id)
    @friendlist2 = Friendlist.find_by_user_id_and_friend_id(@friend.id, @user.id)
    if(@friendlist1.nil? or @friendlist2.nil?)
     return 1
    else
     return 0
    end 
  end

end
