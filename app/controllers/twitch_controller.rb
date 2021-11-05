class TwitchController < ApplicationController
  def login
    respond_to do |format|
      format.html
    end
  end

  def sign_user
    access_token = cookies[:access_token]
    client_id = ENV['TWITCH_CLIENT_ID']
    url = 'https://api.twitch.tv/helix/users'
    headers = {
      'Client-Id' => client_id,
      'Authorization' => "Bearer #{access_token}"
    }
    response = RestClient.get(url, headers)
    viewer_data = JSON.parse(response.body)['data'].first
    @viewer = Viewer.find_or_create_by(twitch_id: viewer_data['id']) do |viewer|
      viewer.twitch_login = viewer_data['login']
      viewer.twitch_display_name = viewer_data['display_name']
      viewer.email = viewer_data['email']
      viewer.profile_image_url = viewer_data['profile_image_url']
      viewer.skip_password_validation = true
    end

    cookies[:twitch_access_token] = access_token

    sign_in @viewer
  end
end
