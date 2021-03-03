class DogsParksController < ApplicationController
  def new
    @dogs_parks = Dogs_parks.find(params[:parks_id])
    @parks = Parks.new
  end
end
