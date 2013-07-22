FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "person#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end