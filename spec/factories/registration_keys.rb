FactoryBot.define do
  factory :registration_key do
    user
    combination { 'MyString' }
  end
end
