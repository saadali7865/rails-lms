# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { "My Book Title" }
    category { "horror" }
    is_active { true }
    user { association :user }

    trait :active do
      is_active { true }
    end

    trait :inactive do
      is_active { false }
    end
  end
end