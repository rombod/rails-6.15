FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@email.com" }
  factory :user do
    email
    password "johndoe"
    password_confirmation { |u| u.password }
    first_name "John"
    last_name "Doe"
    admin false
  end

  factory :admin, class: User do
    email
    password "janedoe"
    password_confirmation { |u| u.password }
    first_name "Jane"
    last_name "Doe"
    admin false
  end
end