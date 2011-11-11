class HomeController < ApplicationController
  def index
    @upload = Upload.new
    flash.now[:notice] = "hello there"
    render :index
  end
end
