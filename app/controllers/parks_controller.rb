class ParksController < ApplicationController
  def index
    @parks = Park.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @parks.geocoded.map do |flat|
      {
        lat: park.latitude,
        lng: park.longitude
      }
    end
  end
end
