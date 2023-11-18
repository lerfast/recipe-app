FactoryBot.define do
    factory :user do
      name { "John Doe" }
      email { "john@example.com" }
      password { "password" }
      confirmed_at { Time.now } # Asegúrate de que el usuario esté confirmado
    end
  end
  