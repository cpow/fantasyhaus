class YahooAuth
  include Mongoid::Document
  belongs_to :user
  field :user_id, type: String
  field :provider, type: String
  field :uid, type: String
  field :token, type: String
  field :secret, type: String
end
