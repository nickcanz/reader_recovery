class RemoveContentFromUpload < ActiveRecord::Migration
  def up
    remove_column :uploads, :content
  end

  def down
    add_column :uploads, :content, :text
  end
end
