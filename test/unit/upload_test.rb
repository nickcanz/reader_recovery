require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  test "upload time is required" do
    upload = Upload.new
    upload.contents = "the contents"
    assert !upload.save
  end

  test "contents is required" do
    upload = Upload.new
    upload.upload_time = Time.now
    assert !upload.save
  end

  test "having required fields marks as valid" do
    upload = Upload.new
    upload.upload_time = Time.now
    upload.contents = "the contents"
    assert upload.valid?
  end
end
