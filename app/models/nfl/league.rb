class Nfl::League
  include Mongoid::Document

  belongs_to :yahoo_auth

  field :name, type: String
  field :league_id, type: Integer
  field :type, type: String

  def self.check_and_save auth
    
  end
end