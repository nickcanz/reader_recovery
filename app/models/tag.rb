class Tag < ActiveRecord::Base
  belongs_to :note

  validates :name, :presence => true

  def self.save_from_upload tags, note_record
    tags && tags.each do |tag|
      tag =~ %r{/label/}
      $~ && Tag.create(
        :note_id => note_record.id,
        :name => $'
      )
    end
  end
end
