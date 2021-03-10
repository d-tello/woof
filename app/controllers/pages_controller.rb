class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @viewed_park = current_user.dogs.first.viewed_park unless current_user.dogs.empty?
    @dog = current_user.dogs.first
    if @viewed_park
      @dogs = Dog.joins(:dogs_parks).where(dogs_parks: {park: @viewed_park}).where(dogs: {ready_to_walk: true})
    else
      @dogs = Dog.all
    end
  end
end
