class UsersController < ApplicationController
  def show
    @user = current_user
    @dogs = @user.dogs.order('name')

    @qrcode = RQRCode::QRCode.new("www.woof.network/dogs/#{@dogs.first.id}")

    @svg = @qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    )
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render 'pages/home'
    end
  end
end
