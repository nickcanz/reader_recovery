require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  test "should get the index page" do

    get :index
    assert_response :success

    actual_uploads = assigns(:uploads)
    assert_not_nil actual_uploads

    assert_equal Upload.all.length, actual_uploads.length
  end
end
