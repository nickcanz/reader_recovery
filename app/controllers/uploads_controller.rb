class UploadsController < ApplicationController
  def create
    f = params[:upload][:file]
    raw_json = f.read.to_s

    parsed_upload = JSON.parse(raw_json)

    upload = Upload.create!(:upload_time => Time.now.utc, :name => params[:upload][:name]) do |u|
      u.items = parsed_upload["items"]
    end
    redirect_to :controller => 'notes', :action => 'index', :upload_id => upload.id
  end

  def index
    @uploads = Upload.all
    render :index
  end

  def new
    @upload = Upload.new
    render :new
  end
end
