class AuthenticationsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"] 
    auth_params = auth[:extra][:access_token].params
    current_user.yahoo_auths.create(
      provider: auth['provider'], 
      uid: auth['uid'], user_id: current_user.id,
      token: auth_params[:oauth_token],
      secret: auth_params[:oauth_token_secret],
      session_handle: auth_params[:oauth_session_handle]
      )
    flash[:notice] = "Authentication successful."
    redirect_to user_dashboard_index_path(current_user)
  end
end
