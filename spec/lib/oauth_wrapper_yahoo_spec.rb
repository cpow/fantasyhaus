require 'spec_helper'

describe OauthWrapper::Yahoo do
  let(:auth){FactoryGirl.create :yahoo_auth}
  describe ".new" do
    before(:each){OauthWrapper::Yahoo.new}
  end
end