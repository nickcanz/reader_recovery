class AddTitleHrefToNote < ActiveRecord::Migration
  def change
    add_column :notes, :title_href, :string
  end
end
