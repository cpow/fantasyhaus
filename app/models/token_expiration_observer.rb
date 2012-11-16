class TokenExpirationObserver < Mongoid::Observer
  observe :yahoo_auth

  def after_initialize(record)
    record.refresh_access_token if record.expired?
  end
end