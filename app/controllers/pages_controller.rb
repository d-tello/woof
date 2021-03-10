class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @viewed_park = current_user.dogs.first.viewed_park unless current_user.dogs.empty?
    @dog = current_user.dogs.first
    if @viewed_park
      # I want all the dogs for which there is a DogsPark instance with a park_id of the viewed_park of the current user
      @dogs = Dog.joins(:dogs_parks).where(dogs_parks: {park: @viewed_park})
    else
      @dogs = Dog.all
    end
  end
end
