FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email #"example@example.com"
    password "1234321"
    first_name "Ex"
    last_name "Ample"
    admin false
  end

  factory :admin, class: User do
    email #"Hefe@example.com"
    password "ImTheBoss"
    first_name "Admin"
    last_name "User"
    admin true
  end
end
