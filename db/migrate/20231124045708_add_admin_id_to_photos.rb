class AddAdminIdToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :admin_id, :integer, foreign_key: true
  end
end
