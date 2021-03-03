class DogsController < ApplicationController
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

  private

  def dog_params
    params.require(:dog).permit(:name, :photos, :breed, :age, :bio)
  end
end
