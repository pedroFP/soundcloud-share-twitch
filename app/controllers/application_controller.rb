# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  devise_group :session, contains: %i[admin viewer]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    current_session
  end

  protected

  def authenticate_viewer!
    return super if viewer_signed_in?

    redirect_to helpers.twitch_login_url
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to (request.referrer || root_path), status: :unauthorized
  end

end
