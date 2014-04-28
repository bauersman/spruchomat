class HomeController < ApplicationController
  #caches_action :index, expires_in: 30.minutes

  def index
  end

  def about
    redirect_to 'http://www.leitmedium.de/2013/09/17/wahlplakate-raten-mit-dem-wahlplakatomat/'
  end
end
