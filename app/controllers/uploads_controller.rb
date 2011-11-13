class UploadsController < ApplicationController
  def create
    f = params[:upload][:file]
    redirect_to uploads_path
  end

  def index
    render :index
  end
end
