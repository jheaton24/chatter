FactoryBot.define do
  factory :user do
    name { "Testy Tester" }
    email { "testytest@gmail.com" }
    username { "testyt123" }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
