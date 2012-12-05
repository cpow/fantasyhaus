module YahooFantasy
  class Nfl
    def initialize obj
      @obj = obj
    end

    def leagues game_key
      leagues = @obj.access_token.request(:get, "http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=#{game_key}/leagues")
      return xml_parser.leagues(leagues)
    end

    def players 
      leagues = @obj.access_token.request(:get, "http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=273/leagues")
      league_key = xml_parser.league_key(leagues).first
      players = @obj.access_token.request(:get, "http://fantasysports.yahooapis.com/fantasy/v2/team/273.l.408688.t.8/players")
      return xml_parser.players(players)
    end

    private

      def xml_parser
        XmlParser::Yahoo.new
      end
  end
end