class NotesController < ApplicationController
  def index
    @notes = params[:upload_id].nil?  ? Note.all(:limit => 5) : Note.where(:upload_id => params[:upload_id]).limit(5)
    render :index
  end
end
