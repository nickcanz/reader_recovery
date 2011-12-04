class RemoveNoteIdFromTags < ActiveRecord::Migration
  def up
    remove_column :tags, :note_id
  end

  def down
    add_column :tags, :note_id, :integer
  end
end
