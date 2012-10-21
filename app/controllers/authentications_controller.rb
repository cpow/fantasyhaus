class AuthenticationsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"] 
    current_user.yahoo_auths.create(provider: auth['provider'], uid: auth['uid'])
    flash[:notice] = "Authentication successful."
    redirect_to authentications_url
  end

  def index
    @authentications = current_user.yahoo_auths if current_user
  end
end
