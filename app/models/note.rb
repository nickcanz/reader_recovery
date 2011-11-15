require 'uri'

class Note < ActiveRecord::Base
  has_many :tags
  belongs_to :uploads

  validates :title, :presence => true
  validates :href, :presence => true
  validates :href, :format => {
    :with => URI.regexp(%w( http https ))
  }
  validates :published_date, :presence => true
end
