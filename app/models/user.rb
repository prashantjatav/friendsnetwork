class User < ActiveRecord::Base

  has_one :profile
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
