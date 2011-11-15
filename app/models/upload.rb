class Upload < ActiveRecord::Base
  has_many :notes

  validates :upload_time, :presence => true
  validates :contents, :presence => true
end
