# Twitch API

[How to get the API KEYS](https://dev.twitch.tv/docs/authentication/getting-tokens-oauth)

[Authentication Scopes](https://dev.twitch.tv/docs/api/migration#authentication-scopes)

[Twitch API Reference](https://dev.twitch.tv/docs/api/reference)

## How to setup the Twitch oauth locally

1. First, download [ngrok](https://ngrok.com/) </br>
2. Open the ngrok file, a terminal will be displayed </br>
3. run `$ ngrok http 3000` and copy the **https** link</br>
4. Don not close the terminal while the local app is running
5. Open the twitch's dev [console](https://dev.twitch.tv/console/)
6. Select your app and paste the ngrok https URL into the **OAuth redirect URL** input field
7. Save
8. Copy the ngrok https URL into the `env['TWITCH_REDIRECT_URL']`
9. Copy the Client ID into the `env['TWITCH_CLIENT_ID']`

(may take a few seconds till the redirect URL works for Twitch)
