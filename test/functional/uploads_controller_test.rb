require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  test "should get the index page" do

    get :index
    assert_response :success

    actual_uploads = assigns(:uploads)
    assert_not_nil actual_uploads

    assert_equal Upload.all.length, actual_uploads.length
  end

  test "creates upload from file" do
    sample_file = File.join(File.expand_path(File.dirname(__FILE__)), 'sample_upload.json')
    post :create, { :upload => { :file => Rack::Test::UploadedFile.new(sample_file, 'application/json') } }
    assert_response :redirect
    assert_redirected_to(:controller => 'uploads', :action => 'index')
    upload = Upload.find(:all, :order => 'created_at desc', :limit => 1).first
    assert_equal File.open(sample_file).read, upload.contents
  end

  test "creates notes from file upload" do

    initial_notes_count = Note.all.count

    sample_file = File.join(File.expand_path(File.dirname(__FILE__)), 'sample_upload.json')
    post :create, { :upload => { :file => Rack::Test::UploadedFile.new(sample_file, 'application/json') } }

    assert_response :redirect
    assert_redirected_to(:controller => 'uploads', :action => 'index')

    assert_equal initial_notes_count+2, Note.all.count
  end
end
