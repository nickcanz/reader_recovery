class Note < ActiveRecord::Base
  has_many :tags

  validates :title, :presence => true
  validates :href, :presence => true
  validates :published_date, :presence => true
end
