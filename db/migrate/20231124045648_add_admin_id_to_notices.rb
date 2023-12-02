class AddAdminIdToNotices < ActiveRecord::Migration[6.0]
  def change
    add_column :notices, :admin_id, :integer, foreign_key: true
  end
end
