class HomeController < ApplicationController
  caches_action :index, expires_in: 30.minutes

  def index
  end

  def about
    redirect_to 'http://www.leitmedium.de/'
  end
end
