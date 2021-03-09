class DogsController < ApplicationController
  def show
    @dog = Dog.find(params[:id])
    @sent_sniff = Sniff.find_by(sniffer: current_user.dogs.first, sniffed: @dog)
    @received_sniff = Sniff.find_by(sniffer: @dog, sniffed: @current_user.dogs.first)
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

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      redirect_to root_path
    else
      render "pages/home"
    end
  end


  def discover
    @dog = Dog.all.sample
  end

  def toggle_ready_to_walk
    @dog = Dog.find(params[:id])
    @dog.toggle! :ready_to_walk
    redirect_to user_path(current_user)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :photos, :breed, :age, :bio, :viewed_park_id)
  end
end
