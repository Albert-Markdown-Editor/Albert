FactoryBot.define do
  # Base Factory
  factory :document do
    sequence :name do |n| "Document n°#{n}" end
    sequence :description do |n| "This is the description for document n°#{n}" end
    status { 0 }
  end
end
