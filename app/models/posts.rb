# app/models/post.rb
class Post < ApplicationRecord
  belongs_to :user
end

# app/models/user.rb
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
end
