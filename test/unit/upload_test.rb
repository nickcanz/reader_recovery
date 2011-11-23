require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  test "Upload:upload_time is required" do
    upload = Upload.new
    upload.name = "my upload"
    assert upload.invalid?
  end

  test "Upload:name is required" do
    upload = Upload.new
    upload.upload_time = Time.now
    assert upload.invalid?
  end

  test "Upload having required fields marks as valid" do
    upload = Upload.new
    upload.upload_time = Time.now
    upload.name = "my content"
    assert upload.valid?
  end
end
