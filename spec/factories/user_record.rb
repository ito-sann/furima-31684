FactoryBot.define do
  factory :user_record do
    postal_code { '111-1111' }
    region_id { 2 }
    municipality { '岐阜市' }
    house_number { '◯◯街1-1-1' }
    phone_number { '00000000000' }
    building_number { 'aaaa' }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
