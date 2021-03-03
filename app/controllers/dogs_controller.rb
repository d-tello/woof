class DogsController < ApplicationController
  def index
    @dogs = Dogs.all
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
