class RemoveHrefFromNotes < ActiveRecord::Migration
  def up
    remove_column :notes, :href
  end

  def down
    add_column :notes, :href, :string
  end
end
