class Upload < ActiveRecord::Base
  has_many :notes

  validates :upload_time, :presence => true
  validates :name, :presence => true

  accepts_nested_attributes_for :notes, :reject_if => :all_blank

  def items=(items)
    self.notes_attributes = items.map{|item| self.class.note_attributes_from_item(item) }
  end

protected

  def self.note_attributes_from_item(item)
    item["content"]      ||= {"content" => ''}
    item["categories"]   ||= []
    item["alternate"]    ||= []
    item["alternate"][0] ||= {}
    {
      :title           => item["title"],
      :title_href      => item["alternate"][0]["href"],
      :content         => item["content"],
      :published_date  => item["published"],
      :tags_attributes => self.tag_attributes_from_categories(item["categories"])
    }
  end

  def self.tag_attributes_from_categories(categories)
    categories.map do |category|
      { :name => category =~ %r{/label/} ? $' : nil }
    end
  end
end
