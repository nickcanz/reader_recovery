class NotesController < ApplicationController
  def index
    @notes = Note.where(:upload_id => params[:upload_id])
    render :index
  end
end
