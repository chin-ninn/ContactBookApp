class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.string     :notice_title, null: false
      t.text       :notice_text, null: false
      t.timestamps
    end
  end
end
