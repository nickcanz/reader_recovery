class Upload < ActiveRecord::Base
  has_many :notes

  validates :upload_time, :presence => true
  validates :name, :presence => true
end
