FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password '1superpassword'

    factory :user_with_no_lists do
      transient do
        lists_count 0
      end
    end
  end
end
