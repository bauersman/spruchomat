class HomeController < ApplicationController
  caches_action :index, expires_in: 30.minutes

  def index
  end

  def about
    redirect_to "http://www.leitmedium.de/2014/05/05/wahlplakate-raten-mit-dem-wahlplakat-o-mat-eu2014-edition/"
  end
end
