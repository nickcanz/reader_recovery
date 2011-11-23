class UploadsController < ApplicationController
  def create
    f = params[:upload][:file]
    raw_json = f.read.to_s
    upload_record = Upload.create(:upload_time => Time.now.utc, :name => params[:upload][:name])

    parsed_upload = JSON.parse(raw_json)
    Note.save_from_upload(parsed_upload["items"], upload_record)
    redirect_to :controller => 'notes', :action => 'index', :upload_id => upload_record.id
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
