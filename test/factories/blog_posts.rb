FactoryBot.define do
  factory :blog_post do
    title { "Today we cook: #{Faker::Food.dish}" }
    summary { "This is how I cook it: #{Faker::Food.description}" }
    release_date { rand(10..360).days.from_now }
    project { nil }
  end
end
