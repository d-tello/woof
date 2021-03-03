class DogsController < ApplicationController
   def new
     @dogs = Dog.new
   end

   # def index
   #   @dogs = Dogs.all
   # end

   def show
     @dog = Dog.find(params[:dog_id])
   end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :photo, :bio)
  end
end
