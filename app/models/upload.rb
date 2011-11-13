class Upload < ActiveRecord::Base
  validates :upload_time, :presence => true
  validates :contents, :presence => true
end
