class DashboardController < ApplicationController
  def index
    @players = []
    @user = User.find params[:user_id]
    @authentications = @user.yahoo_auths
    @authentications.each_with_index do |auth, i|
      @leagues = auth.leagues
      @players[i] = auth.players
    end
  end
end
