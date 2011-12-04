class Tag < ActiveRecord::Base
  has_many :note_tag_relationships
  has_many :notes, :through => :note_tag_relationships

  validates :name, :presence => true
end
