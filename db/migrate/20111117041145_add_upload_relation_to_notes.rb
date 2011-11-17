class AddUploadRelationToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :upload_id, :integer
  end
end
