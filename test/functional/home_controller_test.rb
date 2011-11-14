require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success

    actual_upload = assigns(:upload)
    assert_not_nil actual_upload
    assert_nil actual_upload.contents
    assert_nil actual_upload.upload_time
  end
end
