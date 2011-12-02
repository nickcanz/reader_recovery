require 'uri'

class Note < ActiveRecord::Base
  has_many :tags
  belongs_to :upload

  validates_presence_of :title, :content, :published_date, :title_href

  accepts_nested_attributes_for :tags, :reject_if => :all_blank
end
