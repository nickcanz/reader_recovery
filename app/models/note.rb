require 'uri'

class Note < ActiveRecord::Base
  has_many :tags
  belongs_to :upload

  validates_presence_of :title, :content, :published_date, :title_href

  def self.save_from_upload items, upload_record
    items.each do |item|
      n = Note.create(
        :upload_id => upload_record.id,
        :title => item["title"],
        :title_href => item["alternate"]["href"],
        :content => item["content"].nil? ? "" : item["content"]["content"],
        :published_date => item["published"]
      )
      Tag.save_from_upload item["categories"], n
    end
  end
end
