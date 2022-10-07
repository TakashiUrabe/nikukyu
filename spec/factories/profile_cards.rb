FactoryBot.define do
  factory :profile_card do
    user { nil }
    name { "MyString" }
    gender { 1 }
    birthday { "2022-10-07" }
    face_image { "MyString" }
    pad_image { "MyString" }
    favorite_toy { "MyString" }
    favorite_treat { "MyString" }
    personality { 1 }
    card_type { 1 }
  end
end
