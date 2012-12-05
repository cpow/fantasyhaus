class TokenExpirationObserver < Mongoid::Observer
  observe :yahoo_auth

  def after_initialize(record)
    if record.access_token_expiration and record.expired?
      record.refresh_access_token
    end
  end
end