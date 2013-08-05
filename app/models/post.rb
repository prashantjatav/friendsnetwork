class Post < ActiveRecord::Base
 
  belongs_to :user, :class_name => 'User', :foreign_key =>'sender_id'
  has_many :photos, :as => :imagable
  has_many :comments
  has_many :likes
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :comments
  attr_accessible :message, :reciever_id, :sender_id, :share_with, :photos_attributes, :comments_attributes
end
