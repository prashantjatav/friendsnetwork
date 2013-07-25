class Photo < ActiveRecord::Base
  belongs_to :imagable, :polymorphic => true
  
  attr_accessible :imagable_id, :imagable_type, :image
  
  
  mount_uploader :image, PhotoUploader
end
