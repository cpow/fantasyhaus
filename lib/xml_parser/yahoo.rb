module XmlParser
  class Yahoo
    def leagues output
      league_names = []
      doc = REXML::Document.new(output.body)
      doc.root.each_element("//users/user/games/game/leagues/league/name"){|l| league_names << l.text}
      return league_names
    end

    def players output
      players = []
      doc = REXML::Document.new(output.body)
      doc.root.each_element('//player/name/full'){|name| players << name.text}
      return players
    end

    def league_key output
      league_keys = []
      doc = REXML::Document.new(output.body)
      doc.root.each_element("//users/user/games/game/leagues/league/league_key"){|l| league_keys << l.text}
      return league_keys
    end
  end
end