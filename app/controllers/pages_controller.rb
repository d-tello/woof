class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @parks = current_user.dogs.first.parks
    raise
  end
end
