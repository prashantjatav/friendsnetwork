class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :imagable_id
      t.string :imagable_type
      t.string :image

      t.timestamps
    end
  end
end
