FactoryBot.define do
  factory :registration_key do
    user
    combination { '123456789123456789123456333' }
  end
end
