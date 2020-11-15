FactoryBot.define do
  factory :item do
    name { 'abc' }
    text { Faker::Lorem.sentence }
    image { Faker::Lorem.sentence }
    category_id { '3' }
    condition_id { '2' }
    burden_id { '2' }
    region_id { '2' }
    day_id { '2' }
    price { '800' }
    association :user
  end
end
