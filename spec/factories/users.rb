FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    kanji_sei_name        { '田中' }
    kanji_mei_name        { '将大' }
    katakana_sei_name     { 'アウト' }
    katakana_mei_name     { 'プット' }
    birthday              { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
  end
end
