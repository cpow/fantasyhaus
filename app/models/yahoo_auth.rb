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

  def leagues
    yahoo_fantasy.leagues 273
  end

  def players
    yahoo_fantasy.players
  end

  protected

  def save_time
    self.access_token_expiration = Time.zone.now + 60.minutes
  end

  def save_leagues
    Nfl::League.check_and_save self
  end

  private

    def oauth_wrapper
      OauthWrapper::Yahoo.new(self)
    end

    def yahoo_fantasy
      YahooFantasy::Nfl.new(self)
    end
end
