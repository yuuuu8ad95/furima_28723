FactoryBot.define do
  factory :user doexit
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Gimei.unique.first.kanji}     
    family_name           {Gimei.unique.last.kanji }
    first_name_kana       {Gimei.unique.first.katakana}           
    family_name_kana      {Gimei.unique.last.katakana}
    birthday              {Faker::Date.birthday}
  end
end