class DogsController < ApplicationController
  def show
    @dog = Dog.find(params[:id])
    @sniff = Sniff.find_by(sniffer: current_user.dogs.first, sniffed: @dog)

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
    park_id = params.require(:dog).permit(:park_ids)[:park_ids]
    park = Park.find(park_id)
    @dog.parks << park
    @dog.viewed_park = park
    if @dog.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      # if request comes from user page, redirect to user show page, otherwise to home
      if params[:dog][:park_ids]
        redirect_to users_path
      else
        redirect_to root_path
      end
    else
      render 'pages/home'
    end
  end

  def discover
    @dog = Dog.all.sample
  end

  def toggle_ready_to_walk
    @dog = Dog.find(params[:id])
    @dog.toggle! :ready_to_walk
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :bio, :viewed_park_id, :park_ids, photos: [])
  end
end
