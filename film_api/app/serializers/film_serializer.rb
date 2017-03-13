class FilmSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :description, :average_rating
end
