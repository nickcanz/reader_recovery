require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  test "should get the index page" do
    get :index
    assert_response :success

    actual_uploads = assigns(:uploads)
    assert_not_nil actual_uploads

    assert_equal Upload.all.count, actual_uploads.count
  end

  test "creates upload from file" do
    sample_file = File.join(File.expand_path(File.dirname(__FILE__)), 'sample_upload.json')
    post :create, { :upload => { :name => 'The best upload', :file => Rack::Test::UploadedFile.new(sample_file, 'application/json') } }
    upload = Upload.find(:all, :order => 'created_at desc', :limit => 1).first
    assert_response :redirect
    assert_redirected_to(:controller => 'notes', :action => 'index', :upload_id => upload.id )
    assert_equal 'The best upload', upload.name
  end
end
