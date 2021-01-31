FactoryBot.define do
  factory :post do
    event_id {2}
    shooting_date {Faker::Date.in_date_period}

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end