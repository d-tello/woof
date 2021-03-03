class PagesController < ApplicationController

  def home
    @parks = current_user.dogs.first.parks
  end
end
