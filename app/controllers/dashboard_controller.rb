class DashboardController < ApplicationController
  def index
    @leagues = []
    @user = User.find params[:user_id]
    @authentications = @user.yahoo_auths
    @authentications.each do |auth|
      @leagues << auth.league
    end
  end
end
