class FilmsController < ApplicationController
  has_scope :by_title, as: :title, only: [:index]

  def index
    # support simple pagination
    if params[:limit]
      @films = Film.limit(params[:limit]).offset(params[:offset])
      render json: @films
    else
      @films = apply_scopes(Film.all)
      render json: @films
    end
  end

  def show
    @film = Film.friendly.find(params[:id])
    render json: @film
  end
end
