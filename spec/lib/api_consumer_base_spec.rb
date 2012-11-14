require 'spec_helper'

describe ApiConsumer::Base do
  describe ".new" do
    before(:each){ApiConsumer::Base.new}

    it {should respond_to(:create_consumer)}
    it {should respond_to(:access_token_from_hash)}
  end
end