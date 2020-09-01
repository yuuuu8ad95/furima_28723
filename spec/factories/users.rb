FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@gmail.com"}
    password              {"000000"}
    password_confirmation {password}
    first_name            {優}     
    family_name           {山本}
    first_name_kana       {ユウ}           
    family_name_kana      {ヤマモト}
    birthday              {{1=>1994, 2=>12, 3=>1}
  end
end