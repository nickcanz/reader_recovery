class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.datetime :upload_time
      t.string :name

      t.timestamps
    end
  end
end
