# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  devise_group :session, contains: %i[admin viewer]
  
  def pundit_user
    current_session
  end
  protected
  def authenticate_viewer!
    if viewer_signed_in?
      super
    else
      redirect_to helpers.twitch_login_url
    end
  end
end
