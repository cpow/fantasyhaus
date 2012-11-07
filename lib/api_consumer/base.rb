module ApiConsumer
  class Base
    
    def create_consumer(site)
      return OAuth::Consumer.new(API_KEY, API_SECRET, {site: site})
    end

    def access_token_from_hash(consumer, token_hash)
      return OAuth::AccessToken.from_hash(consumer, token_hash)
    end
  end
end