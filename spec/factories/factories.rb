FactoryGirl.define do 
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
  end

  factory :discussion do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    user
  end
end
