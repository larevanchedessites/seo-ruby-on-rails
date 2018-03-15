FactoryBot.define do
  factory :post do
    title { Faker::Company.name }
    content { Faker::Markdown.random }
  end
end
