class CreateNoteTagRelationships < ActiveRecord::Migration
  def change
    create_table :note_tag_relationships do |t|
      t.integer :note_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
