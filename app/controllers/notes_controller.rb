class NotesController < ApplicationController
  def index

    @notes = params[:upload_id].nil?  ? Note.all : Note.where(:upload_id => params[:upload_id])
    render :index
  end
end
