FactoryBot.define do
  factory :group do
    name { "some category" }
    icon { "icon path" }
    user
  end
end
