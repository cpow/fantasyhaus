class AuthenticationsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"] 
    current_user.yahoo_auths.create(provider: auth['provider'], uid: auth['uid'], user_id: current_user.id)
    flash[:notice] = "Authentication successful."
    redirect_to user_dashboard_index_path(current_user)
  end

  def index
    @authentications = current_user.yahoo_auths if current_user
  end
end
