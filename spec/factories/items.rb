FactoryBot.define do
  factory :item do
    name { 'abc' }
    text { Faker::Lorem.sentence }
    category_id { '3' }
    condition_id { '2' }
    burden_id { '2' }
    region_id { '2' }
    day_id { '2' }
    price { '800' }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.png')
    end
    association :user
  end
end
