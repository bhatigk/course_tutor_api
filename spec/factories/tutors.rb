FactoryBot.define do
  factory :tutor do
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }

    association :course
  end
end
