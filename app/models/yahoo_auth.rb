class YahooAuth
  include Mongoid::Document
  belongs_to :user
  field :user_id, type: String
  field :provider, type: String
  field :uid, type: String
  field :token, type: String
  field :secret, type: String
  field :session_handle, type: String
  field :access_token_expiration, type: Time

  before_create :save_time

  def expired?
    self.access_token_expiration <= Time.zone.now - 2.minutes
  end

  def access_token
    oauth_wrapper.new_access_token
  end

  def refresh_access_token
    token_attrs = oauth_wrapper.get_new_access_token.params
    self.update_attributes(
      token: token_attrs[:oauth_token],
      secret: token_attrs[:oauth_token_secret],
      session_handle: token_attrs[:oauth_session_handle]
      )
  end

  def consumer
    oauth_wrapper.consumer
  end

  def league
    output = access_token.request(:get, "http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=273/leagues")
    doc = REXML::Document.new(output.body)
    doc.root.elements[1].elements['user[1]/games/game/leagues/league/name'].text
  end

  def players
    player_names = []
    league = access_token.request(:get, "http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=273/leagues")
    doc = REXML::Document.new(league.body)
    doc.root.elements[1].elements['user[1]/games/game/leagues/league/name'].text
    output = access_token.request(:get, "http://fantasysports.yahooapis.com/fantasy/v2/team/273.l.408688.t.8/players")
    doc = REXML::Document.new(output.body)
    doc.root.each_element('//player/name/full'){|name| player_names << name.text}
    return player_names
  end

  protected

  def save_time
    self.access_token_expiration = Time.zone.now + 60.minutes
  end

  private

    def oauth_wrapper
      OauthWrapper::Yahoo.new(self)
    end
end
