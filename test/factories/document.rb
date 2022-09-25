FactoryBot.define do
  # Base Factory
  factory :document do
    name { "Post about something" }
    description { "This is a random post about something" }
    status { 0 }
  end
end
