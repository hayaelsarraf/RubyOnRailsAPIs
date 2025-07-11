class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :image, :created_at
end