FactoryBot.define do
  factory :course do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }

    trait :with_tutors do
      after(:create) do |course|
        course.tutors = build_list(:tutor, 3, course: course)
        course.save!
      end
    end
  end
end
