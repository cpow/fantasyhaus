class DashboardController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @authentications = @user.yahoo_auths
  end
end
