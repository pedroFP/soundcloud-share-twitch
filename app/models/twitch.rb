class Twitch
  SUBSCRIPTIONS_URL = 'https://api.twitch.tv/helix/subscriptions/user'
  USERS_URL = 'https://api.twitch.tv/helix/users'

  def self.check_user_subscription(params)
    query_params = {
      broadcaster_id: params[:broadcaster_id],
      user_id: params[:user_id]
    }
    response = HTTParty.get(SUBSCRIPTIONS_URL, headers: headers(params[:access_token]), query: query_params)
    data = JSON.parse(response.body)

    return false if data['error'].present?

    data['data'].present?
  end

  def self.find_user(access_token)
    response = RestClient.get(USERS_URL, headers(access_token))
    JSON.parse(response.body)['data'].first
  end

  def self.headers(access_token)
    {
      'Client-Id' => ENV['TWITCH_CLIENT_ID'],
      'Authorization' => "Bearer #{access_token}"
    }
  end
end