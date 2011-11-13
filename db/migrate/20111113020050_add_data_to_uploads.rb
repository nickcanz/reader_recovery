class AddDataToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :upload_time, :datetime
    add_column :uploads, :contents, :text
  end
end
