FactoryBot.define do
  factory :user do
    username { "Олег" }
    email { "oleg@example.com" }
    add_attribute(:role) { UsersController::Roles::USER }
    password_digest {  BCrypt::Password.create("123456") }

    trait :admin do
      username { "Admin" }
      email { "admin@example.com" }
      add_attribute(:role) { UsersController::Roles::ADMIN }
      password_digest {  BCrypt::Password.create('123456') }
    end
  end

  factory :book do
    name { "book" }
    author { "author" }
    count { 100 }
  end
end
