class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :body, :created_at
  belongs_to :user
  has_many :tags
  has_many :comments
end
