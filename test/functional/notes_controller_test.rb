require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  test "shows notes related to an upload id" do

    get :index, { :upload_id => 1 }

    assert_response :success

    notes = assigns(:notes)
    assert_not_nil notes

    assert_equal notes.count, Note.where(:upload_id => 1).count
  end
end
