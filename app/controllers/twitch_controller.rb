class TwitchController < ApplicationController
  def login
    respond_to do |format|
      format.html
    end
  end

  def sign_user
    access_token = cookies[:access_token]
    viewer_data = Twitch.find_user(access_token)
    @viewer = Viewer.find_or_create_by(twitch_id: viewer_data['id']) do |viewer|
      viewer.twitch_login = viewer_data['login']
      viewer.twitch_display_name = viewer_data['display_name']
      viewer.email = viewer_data['email']
      viewer.profile_image_url = viewer_data['profile_image_url']
      viewer.skip_password_validation = true
    end

    @viewer.subscriber = Twitch.check_user_subscription(broadcaster_id: ENV['FORERO_ID'],
                                                        user_id: @viewer.twitch_id,
                                                        access_token: access_token)
    @viewer.save

    cookies[:twitch_access_token] = access_token

    sign_in @viewer
    redirect_to root_path
  end
end
