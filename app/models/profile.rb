class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :education, :favourite_movie, :favourite_sport, :first_name, :hometown, :interested_in, :language, :last_name, :link, :location, :middle_name, :political, :quote, :relationship_status, :religion, :user_id, :website, :work
end
