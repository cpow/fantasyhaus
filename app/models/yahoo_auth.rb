class YahooAuth
  include Mongoid::Document
  belongs_to :user
  field :user_id, type: String
  field :provider, type: String
  field :uid, type: String
  field :token, type: String
  field :secret, type: String

  def access_token
    consumer.new_access_token
  end

  def league
   access_token.request(:get, "http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=273/leagues")    
  end

  private

    def consumer
      ApiConsumer::YahooConsumer.new(self)
    end
end
