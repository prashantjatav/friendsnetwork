class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :language
      t.string :link
      t.string :hometown
      t.string :location
      t.string :interested_in
      t.string :political
      t.string :favourite_sport
      t.string :favourite_movie
      t.string :relationship_status
      t.string :religion
      t.string :work
      t.string :education
      t.string :website
      t.string :quote

      t.timestamps
    end
  end
end
