class UploadsController < ApplicationController
  def create
    @text = params[:upload][:file].read
    redirect_to :index
    #respond_to do |format|
    #  format.js
    #end
  end

  def index
    render :index
  end
end
