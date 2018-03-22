class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_title

  def set_title title="Sheevy's | Bed & Breakfast"
  	@page_title = title
  end

end
