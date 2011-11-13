class HomeController < ApplicationController
  def index
    @upload = Upload.new
    render :index
  end
end
