class PartiesController < ApplicationController
  before_filter :set_parties, only: :index
  before_filter :set_party, only: :show

  def index
  end

  def show
  end

  private

  def set_party
    @party = Party.friendly.find(params[:id])
  end

  def set_parties
    @parties = Party.all
  end
end
