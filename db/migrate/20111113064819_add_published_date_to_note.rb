class AddPublishedDateToNote < ActiveRecord::Migration
  def change
    add_column :notes, :published_date, :datetime
  end
end
