class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @parks = current_user.dogs.first.parks
  end
end
