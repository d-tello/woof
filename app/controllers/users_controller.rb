class UsersController < ApplicationController
  def show
    @user = current_user
    @dogs = @user.dogs.order('name')

    @qrcode = RQRCode::QRCode.new("users_url")

    @svg = @qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    )
  end
end
