FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    summary { "This is the summary about the book: blablablabla" }
    release_date { rand(10..360).days.from_now }
    project { nil }
  end
end
