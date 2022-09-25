FactoryBot.define do
  # Base Factory
  factory :document_fragment do
    association :document, factory: :document

    position { 1 }
    content { "MyString" }
    type { "DocumentFragments::P" }
  end

  # Traits
  trait :p do
    type { "DocumentFragments::P" }
  end

  trait :h1 do
    type { "DocumentFragments::H1" }
  end

  # Trait Factories
  factory :p_document_fragment, traits: [:p]
  factory :h1_document_fragment, traits: [:h1]
end
