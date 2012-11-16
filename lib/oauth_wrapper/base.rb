module OauthWrapper
  class Base
    def create_consumer(opts={})
      OAuth::Consumer.new(opts[:api_key], opts[:api_secret], opts[:site])
    end

    def access_token_from_hash(consumer, token_hash)
      OAuth::AccessToken.from_hash(consumer, token_hash)
    end

    def request_token(auth_object)
      OAuth::RequestToken.new(opts[:consumer], opts[:oauth_token], opts[:oauth_token_secret])
    end
  end
end