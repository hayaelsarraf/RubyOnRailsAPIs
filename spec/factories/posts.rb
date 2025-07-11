FactoryBot.define do
  factory :post do
    title { "Test Post" }
    body { "Some body content" }
    association :user
    after(:create) do |post|
      tag = create(:tag)
      post.tags << tag
    end
  end
end
