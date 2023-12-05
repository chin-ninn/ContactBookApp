class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.text :photo_text, null: false
      t.timestamps
    end
  end
end
