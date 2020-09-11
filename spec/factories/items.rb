FactoryBot.define do
  factory :item do
    name              { 'サンプルネコ' }
    explain           { 'テストの商品です' }
    category_id       { Faker::Number.within(range: 2..11) }
    status_id         { Faker::Number.within(range: 2..7) }
    cost_id           { Faker::Number.within(range: 2..3) }
    from_id           { Faker::Number.within(range: 1..47) }
    day_id            { Faker::Number.within(range: 2..4) }
    price             { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
