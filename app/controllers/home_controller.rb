class HomeController < ApplicationController
  def index
    @events = Event.pending
  end
end
