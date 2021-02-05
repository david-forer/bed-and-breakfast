class MenuSerializer
  include JSONAPI::Serializer
  attributes :name, :image, :desc, :price, :status
end
