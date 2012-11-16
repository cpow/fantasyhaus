module OauthWrapper
  class Yahoo < OauthWrapper::Base

    FANTASY_SITE = "http://fantasysports.yahooapis.com"
    LOGIN_SITE = "https://api.login.yahoo.com"
    API_KEY = "dj0yJmk9c0hKRFpVRXBDUWFTJmQ9WVdrOWNrRnZZMEpOTkRnbWNHbzlNVGM1TWpVek1UTTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD0yOQ--"
    API_SECRET = "d907a271fa877fbbaa8a0db63c23d9a7356e7141"

    attr_reader :auth

    def initialize auth
      @auth = auth
    end

    def get_new_access_token
      consumer = create_consumer({
        api_key: API_KEY,
        api_secret: API_SECRET,
        site:{
          site: LOGIN_SITE, 
          request_token_path: "/oauth/v2/get_request_token", 
          access_token_path: "/oauth/v2/get_token", 
          authorize_path: "/oauth/v2/request_auth"
        }
      })
      request_token = create_request_token({consumer: consumer, oauth_token: @auth.token, oauth_token_secret: @auth.secret})
      token = OAuth::Token.new(@auth.token, @auth.secret)
      return request_token.get_access_token(oauth_session_handle: @auth.session_handle, token: token)
    end

    def new_access_token
      access_token_from_hash consumer, token_hash
    end

    def token_hash
      {oauth_token: @auth.token, oauth_token_secret: @auth.secret, oauth_session_handle: @auth.session_handle}
    end

    def consumer
      create_consumer({api_key: API_KEY, api_secret: API_SECRET, site: {site: FANTASY_SITE}})
    end
  end
end