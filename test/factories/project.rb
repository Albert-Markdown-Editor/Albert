FactoryBot.define do
  # Base Factory
  factory :project do
    sequence :name do |n| "Project n°#{n}" end
    sequence :description do |n| "This is the description for project n°#{n}" end
  end
end
