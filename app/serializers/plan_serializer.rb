class PlanSerializer < ActiveModel::Serializer
  attributes :id
  attributes :title
  attributes :description
  attributes :rating
  attributes :price
end
