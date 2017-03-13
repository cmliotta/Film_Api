class RatingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :film_id, :score
end