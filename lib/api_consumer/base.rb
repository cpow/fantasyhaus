module ApiConsumer
  class Base
    def create_consumer(opts={})
      return OAuth::Consumer.new(opts[:api_key], opts[:api_secret], {site: opts[:site]})
    end

    def access_token_from_hash(consumer, token_hash)
      return OAuth::AccessToken.from_hash(consumer, token_hash)
    end
  end
end