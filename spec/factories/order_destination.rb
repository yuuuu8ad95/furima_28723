FactoryBot.define do
  factory :order_destination do
    token                       { "ch_79806011ac394057f0c4770f7b6bd8" }
    postal_code                 { '123-4567'}
    from_id                     { Faker::Number.within(range: 1..47) }
    city                        { Gimei.address.city.kanji }
    address                     { Gimei.address.town.kanji}
    phone_number                { "00000000000" }    
  end
end
