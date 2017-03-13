class FilmSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :description
end
