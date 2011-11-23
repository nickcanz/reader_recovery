require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  test "Upload:upload_time is required" do
    upload = Upload.new
    upload.contents = "the contents"
    assert upload.invalid?
  end

  test "Upload:contents is required" do
    upload = Upload.new
    upload.upload_time = Time.now
    assert upload.invalid?
  end

  test "Upload having required fields marks as valid" do
    upload = Upload.new
    upload.upload_time = Time.now
    upload.contents = "the contents"
    assert upload.valid?
  end
end
