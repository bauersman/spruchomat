class PartiesController < ApplicationController
  before_filter :set_party, only: :show

  def show
    render json: @party
  end

  private

  def set_party
    @party = Party.friendly.find(params[:id])
  end
end
