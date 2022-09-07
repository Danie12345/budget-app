FactoryBot.define do
  factory :group do
    name { 'some category' }
    icon { 'https://www.pngrepo.com/png/123920/512/workers-team.png' }
    user
  end
end
