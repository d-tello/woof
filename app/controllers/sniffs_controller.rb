class SniffsController < ApplicationController
  skip_before_action :get_unread_sniffs

  def index
    @received_sniffs = Sniff.where(sniffed: current_user.dogs.first)
    @sent_sniffs = Sniff.where(sniffer: current_user.dogs.first)
    @unread_sniffs = Sniff.unread_by(current_user).where(sniffed: current_user.dogs.first).mark_as_read! :all, for: current_user
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @sniff = Sniff.new
    @sniff.sniffer = current_user.dogs.first
    @sniff.sniffed = @dog
    if @sniff.save
      redirect_to dog_path(@dog)
    else
      render 'dogs/show'
    end
  end

  def update
    @sniff = Sniff.find(params[:id])
    @sniff.status = true
    if @sniff.save
      @chatroom = Chatroom.create(sniff: @sniff)
      redirect_to chatroom_path(@chatroom)
    else
      render :index
    end
  end

  def destroy
    @sniff = Sniff.find(params[:id])
    @dog = @sniff.sniffed
    if @sniff.destroy
      redirect_to dog_path(@dog)
    else
      render 'dogs/show'
    end
  end
end
