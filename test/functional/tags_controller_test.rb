require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test "index page displays all tags" do
    get :index

    assert_response :success

    actual_tags = assigns(:tags)
    assert_not_nil actual_tags

    assert_equal actual_tags.count, Tag.all.count
  end
end
