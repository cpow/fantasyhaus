# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :yahoo_auth do
    user_id 1
    provider "MyString"
    uid "MyString"
    token "TokenString"
    secret "SecretString"
    session_handle "SessionString"
  end
end
