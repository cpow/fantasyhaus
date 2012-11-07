module ApiConsumer
  class YahooConsumer < ApiConsumer::Base

    attr_reader :token, :secret

    def initialize(opts={})
      consumer = create_consumer(opts[:site])
      token_hash = {oauth_token: opts[:auth].token, oauth_token_secret: opts[:auth].secret}
      return access_token_from_hash(consumer, token_hash)
    end
  end
end