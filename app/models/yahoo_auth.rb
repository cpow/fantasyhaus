class YahooAuth
  include Mongoid::Document
  belongs_to :user
  field :user_id, type: String
  field :provider, type: String
  field :uid, type: String
end
