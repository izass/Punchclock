# frozen_string_literal: true

FactoryBot.define do
  factory :contribution do
    user { create(:user) }
    company { create(:company) }
    state { :received }
    sequence :link do |n| 
      "https://www.github.com/company/example/pull/#{n}"
    end

    trait :rejected do
      state { :reject }
    end

    trait :approved do
      state { :approved }
    end
  end
end
