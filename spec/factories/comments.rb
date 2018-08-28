FactoryBot.define do
  factory :comment do
    content "MyString"
    article
    user
  end
end
