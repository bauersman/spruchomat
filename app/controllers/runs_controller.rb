class RunsController < ApplicationController
  attr_reader :run

  before_filter :load_run, only: [:show, :answer]

  def index
  end

  def new
    @run = current_session.runs.create
    redirect_to @run
  end

  def show
  end

  def answer
    @run.data[:answers] << params[:answer]
    @run.save
    redirect_to @run
  end

  private

  def load_run
    @run = Run.find(params[:id])
  end
end
