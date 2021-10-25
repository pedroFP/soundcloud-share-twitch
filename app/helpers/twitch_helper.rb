module TwitchHelper
  def twitch_login_url
    twitch_url = 'https://id.twitch.tv/oauth2/authorize'
    client_id = "client_id=#{ENV['TWITCH_CLIENT_ID']}"
    redirect_url = "redirect_uri=#{ENV['TWITCH_REDIRECT_URL']}"
    response_type = 'response_type=token'
    scope = 'scope=channel_read%20user_subscriptions'
    state = 'state=logged_in'

    "#{twitch_url}?#{client_id}&#{redirect_url}&#{response_type}&#{scope}&#{state}"
  end
end
