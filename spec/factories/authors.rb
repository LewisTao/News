FactoryGirl.define do
  factory :author do
    name { FFaker::Name.name }
	email { FFaker::Internet.email }
  end

end
