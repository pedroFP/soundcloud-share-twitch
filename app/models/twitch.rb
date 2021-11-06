class Twitch
  SUBSCRIPTIONS_URL = 'https://api.twitch.tv/helix/subscriptions/user'

  def self.check_user_subscription(params)
    headers = {
      'Client-Id' => ENV['TWITCH_CLIENT_ID'],
      'Authorization' => "Bearer #{params[:access_token]}"
    }

    params = {
      broadcaster_id: params[:broadcaster_id],
      user_id: params[:user_id]
    }
    response = HTTParty.get(SUBSCRIPTIONS_URL, headers: headers, query: params)
    data = JSON.parse(response.body)

    return false if data['error'].present?

    data['data'].present?
  end
end