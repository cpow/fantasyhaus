class DashboardController < ApplicationController
  def index
    @leagues = []
    @players = []
    @user = User.find params[:user_id]
    @authentications = @user.yahoo_auths
    @authentications.each do |auth|
      @leagues << auth.league
    @players = @authentications.first.players if @authentications
    end
  end
end
