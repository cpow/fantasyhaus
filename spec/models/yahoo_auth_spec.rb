require 'spec_helper'

describe YahooAuth do
  let(:auth){FactoryGirl.create :yahoo_auth}
  subject{auth}
  describe ".save" do
    before(:each){auth.save}
    specify{subject.should be_valid}

    describe ".expired?" do
      context "when first created" do
        specify{subject.expired?.should be_false}
      end

      context "after 60 minutes" do
        before{
          subject.access_token_expiration = DateTime.now
          subject.save
        }

        specify{subject.expired?.should be_true}
      end
    end
  end
end
