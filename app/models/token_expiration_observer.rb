class TokenExpirationObserver < Mongoid::Observer
  observe :yahoo_auth

  def after_initialize(record)
    record.refresh_access_token if record.access_token_expiration and record.expired?
  end
end