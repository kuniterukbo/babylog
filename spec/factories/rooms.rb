FactoryBot.define do
  factory :room do
    babyname {Faker::Name.name}
    gender_id {2}
    birthday {Faker::Date.in_date_period}

    after(:build) do |room|
      room.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end