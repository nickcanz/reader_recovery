class UploadsController < ApplicationController
  def create
    @upload = params[:file]
    respond_to do |format|
      format.js
    end
  end
end
