module ApiConsumer
  class YahooConsumer < ApiConsumer::Base

    SITE = "http://fantasysports.yahooapis.com"
    API_KEY = "dj0yJmk9c0hKRFpVRXBDUWFTJmQ9WVdrOWNrRnZZMEpOTkRnbWNHbzlNVGM1TWpVek1UTTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD0yOQ--"
    API_SECRET = "d907a271fa877fbbaa8a0db63c23d9a7356e7141"

    attr_reader :auth

    def initialize(auth)
      @auth = YahooAuth.new(auth.attributes)
    end

    def new_access_token
      access_token_from_hash(consumer, token_hash)
    end

    def token_hash
      {oauth_token: @auth.token, oauth_token_secret: @auth.secret}
    end

    def consumer
      create_consumer set_opts
    end

    private

      def set_opts
        {api_key: API_KEY, api_secret: API_SECRET, site: SITE}
      end
  end
end