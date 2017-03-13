class RatingsController < ApplicationController
  # Adding this skip for simplicity, assuming a real application has user/permissions auth
  skip_before_filter :verify_authenticity_token

  def create
    @rating = Rating.create(score: params[:score], film_id: params[:film_id])
    render json: @rating
  end
end
