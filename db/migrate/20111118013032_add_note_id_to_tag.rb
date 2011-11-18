class AddNoteIdToTag < ActiveRecord::Migration
  def change
    add_column :tags, :note_id, :integer
  end
end
