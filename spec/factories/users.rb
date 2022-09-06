FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'user@example.com' }
    password { 'password' }
  end
end
