class AddAdminIdToCalendars < ActiveRecord::Migration[6.0]
  def change
    add_column :calendars, :admin_id, :integer, foreign_key: true
  end
end
