class UsersController < ApplicationController
  def show
    @user = current_user
    @dogs = @user.dogs.order('name')
  end


end
