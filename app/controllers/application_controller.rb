# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  devise_group :session, contains: %i[admin viewer]
  
  def pundit_user
    current_session
  end
end
