require 'uri'

class Note < ActiveRecord::Base
  has_many :tags
  belongs_to :upload

  validates :title, :presence => true
  validates :content, :presence => true
  validates :published_date, :presence => true

  def self.save_from_upload items, upload_record
    items.each do |item|
      n = Note.create(
        :upload_id => upload_record.id,
        :title => item["title"],
        :content => item["content"]["content"],
        :published_date => item["published"]
      )

      Tag.save_from_upload item["categories"], n
    end
  end
end
