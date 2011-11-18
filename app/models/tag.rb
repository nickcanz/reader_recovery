class Tag < ActiveRecord::Base
  belongs_to :note

  validates :name, :presence => true

  def self.save_from_upload tags, note_record
    tags.each do |tag|
      Tag.create(
        :note_id => note_record.id,
        :name => tag
      )
    end
  end
end
