class ApplicationController < ActionController::Base
  protected
  def authenticate_viewer!
    if viewer_signed_in?
      super
    else
      redirect_to helpers.twitch_login_url
    end
  end
end
