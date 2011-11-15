require 'uri'

class Note < ActiveRecord::Base
  has_many :tags
  belongs_to :uploads

  validates :title, :presence => true
  validates :content, :presence => true
  validates :published_date, :presence => true

  def self.save_from_upload items
  end
end
