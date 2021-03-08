class DogsController < ApplicationController
  def show
    @dog = Dog.find(params[:id])
    @sniff = Sniff.find_by(sniffer: current_user.dogs.first, sniffed: @dog)
  end

  def new
    @user = current_user
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user

    if @dog.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def discover
    @dog = Dog.all.sample
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :photos, :breed, :age, :bio)
  end
end
