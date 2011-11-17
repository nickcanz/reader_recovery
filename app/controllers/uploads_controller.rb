class UploadsController < ApplicationController
  def create
    f = params[:upload][:file]
    upload_record = Upload.create(:upload_time => Time.now.utc, :contents => f.read.to_s)

    parsed_upload = JSON.parse(upload_record.contents)
    Note.save_from_upload(parsed_upload["items"], upload_record)
    redirect_to uploads_path
  end

  def index
    @uploads = Upload.all
    render :index
  end
end
