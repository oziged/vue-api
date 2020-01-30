class PlanSerializer < ActiveModel::Serializer
  attribute :id
  attribute :title
  attribute :description
  attribute :rating
  attribute :price
end
