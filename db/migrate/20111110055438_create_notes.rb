class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :title
      t.text :title_href
      t.datetime :published_date
      t.text :content
      t.integer :upload_id

      t.timestamps
    end
  end
end
