require 'uri'

class Note < ActiveRecord::Base
  has_many :note_tag_relationships
  has_many :tags, :through => :note_tag_relationships
  accepts_nested_attributes_for :tags, :reject_if => :all_blank
  accepts_nested_attributes_for :note_tag_relationships

  belongs_to :upload

  validates_presence_of :title, :published_date, :title_href
end
