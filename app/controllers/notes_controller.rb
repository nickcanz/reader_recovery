class NotesController < ApplicationController
  def index
    page = params[:page] || 1
    if (params[:upload_id].nil?)
      @notes = Note.paginate(:page => page)
    else
      @notes = Note.where(:upload_id => params[:upload_id]).paginate(:page => page)
    end
    render :index
  end
end
