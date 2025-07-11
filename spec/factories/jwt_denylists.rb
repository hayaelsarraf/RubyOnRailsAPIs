FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2025-07-07 16:24:43" }
  end
end
