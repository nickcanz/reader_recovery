class UploadsController < ApplicationController
  def create
    f = params[:upload][:file]
    upload_record = Upload.create(:upload_time => Time.now.utc, :contents => f.read.to_s)
    redirect_to uploads_path
  end

  def index
    @uploads = Upload.all
    render :index
  end
end
