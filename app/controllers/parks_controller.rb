class ParksController < ApplicationController
  def index
    @parks = Park.geocoded

    @markers = @parks.map do |park|
      {
        lat: park.latitude,
        lng: park.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { park: park }),
        image_url: helpers.asset_url('little_paw.png')
      }
    end
  end
end
