require 'spec_helper'

describe OauthWrapper::Base do
  describe ".new" do
    before(:each){OauthWrapper::Base.new}

    it {should respond_to(:create_consumer)}
    it {should respond_to(:access_token_from_hash)}
    it {should respond_to(:request_token)}
  end
end