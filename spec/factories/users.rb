FactoryBot.define do
  factory :user do
    email { 'harvard@harvard.edu' }
    name { 'Climate Harvard' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
