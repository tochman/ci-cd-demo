FactoryBot.define do
  factory :comment do
    comment { "MyText" }
    name { "MyString" }
    article { nil }
  end
end
