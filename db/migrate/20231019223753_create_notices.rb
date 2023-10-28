class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.string     :notice_title
      t.text       :notice_text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
