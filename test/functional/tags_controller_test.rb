require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test "Tags#index page displays all tags" do
    get :index

    assert_response :success

    actual_tags = assigns(:tags)
    assert_not_nil actual_tags

    assert_equal actual_tags.count, Tag.all.count
  end

  test "Tags#show assigns tag var" do
    t = Tag.create(:name => 'The tag')

    get :show, { :id => t.id }

    assert_response :success
    actual_tag = assigns(:tag)

    assert_not_nil actual_tag

    assert_equal "The tag", actual_tag.name
  end
end
