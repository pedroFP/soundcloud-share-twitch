# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  devise_group :session, contains: %i[admin viewer]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    current_session
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  protected

  def authenticate_viewer!
    return super if viewer_signed_in?

    redirect_to helpers.twitch_login_url
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    redirect_to (request.referrer || root_path), status: :unauthorized
  end

end
