class HomeController < ApplicationController
  caches_action :index, expires_in: 30.minutes
  skip_before_filter :setup_session, only: :health

  def index
  end

  def health
    render text: 'good'
  end

  def about
    redirect_to "http://www.leitmedium.de/2014/05/05/wahlplakate-raten-mit-dem-wahlplakat-o-mat-eu2014-edition/"
  end
end
