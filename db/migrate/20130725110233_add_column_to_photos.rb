class AddColumnToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :content_type, :string
  end
end
