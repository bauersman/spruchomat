class ApplicationController < ActionController::Base
  attr_reader :current_session

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :setup_session

  def setup_session
    @current_session ||= ::Session.find_or_create_by_uuid(session['uuid'])
    session['uuid'] = @current_session.uuid
  end

  def parties
    %w(SPD CSU Die\ Partei Piratenpartei Graue\ Panther)
  end
end
