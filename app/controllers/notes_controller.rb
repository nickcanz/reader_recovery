class NotesController < ApplicationController
  def index
    @notes = Note.all
    render :index
  end
end
