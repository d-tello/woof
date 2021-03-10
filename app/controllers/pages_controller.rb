class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @dog = current_user.dogs.first
    if params[:park]
      @viewed_park = Park.find(params[:park])
      if @viewed_park
        @dog.viewed_park = @viewed_park
        @dog.save!
        @dogs = Dog.joins(:dogs_parks).where(dogs_parks: {park: @viewed_park})
      else
        @dogs = Dog.all
      end

    else
      @viewed_park = current_user.dogs.first.viewed_park unless current_user.dogs.empty?
      if @viewed_park
    # I want all the dogs for which there is a DogsPark instance with a park_id of the viewed_park of the current user
        @dogs = Dog.joins(:dogs_parks).where(dogs_parks: {park: @viewed_park}).where(dogs: {ready_to_walk: true})
      else
        @dogs = Dog.all
      end

    end
  end
end
