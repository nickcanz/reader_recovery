class UploadController < ApplicationController
  def create
    respond_to do |format|
      if @upload.save
        format.js
      end
    end
  end
end
