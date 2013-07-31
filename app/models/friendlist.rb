class Friendlist < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key =>'friend_id'
  attr_accessible :friend_id, :status, :user_id, :update_attributes
  scope :current_friends, lambda { |user| where("status = 'accepted' and friend_id=?",user ) }
  scope :pending_requests, lambda { |user| where("status = 'pending' and user_id=?",user ) }
  scope :requested_friends, lambda { |user| where("status = 'requested' and user_id=?",user ) }
end
