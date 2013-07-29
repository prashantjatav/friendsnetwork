class User < ActiveRecord::Base

  has_one :profile
  has_many :friendlists, :dependent => :destroy
  has_many :friends, :through => :friendlists, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendlists, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
  has_many :pending_friends, :through => :friendlists, :source => :friend, :conditions => "status = 'pending'", :order => :created_at
  accepts_nested_attributes_for :profile
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  #  before_filter :authenticate_user!

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :birthdate, :email_id, :first_name, :gender, :last_name, :password, :profile_attributes, :photo_attributes
  
end
