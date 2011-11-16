require 'uri'

class Note < ActiveRecord::Base
  has_many :tags
  belongs_to :uploads

  validates :title, :presence => true
  validates :content, :presence => true
  validates :published_date, :presence => true

  def self.save_from_upload items
    items.each do |item|
      Note.create(
        :title => item["title"],
        :content => item["content"]["content"],
        :published_date => item["published"]
      )
    end
  end
end
