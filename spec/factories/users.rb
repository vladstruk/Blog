FactoryGirl.define do
  factory :user do
  	name "Smith"
  	role "blogger"
  	email "blogger@mail.com"
  	password "blogger"
  	active true
  end
end