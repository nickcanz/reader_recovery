class NoteTagRelationship < ActiveRecord::Base
  belongs_to :note
  belongs_to :tag

  accepts_nested_attributes_for :tag
end
