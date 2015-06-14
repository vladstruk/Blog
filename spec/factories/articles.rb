FactoryGirl.define do
  factory :article do
  	title "Home"
  	content "Content"
  	association :user
  end
end