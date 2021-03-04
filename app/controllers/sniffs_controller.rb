class SniffsController < ApplicationController
  def index
    @received_sniffs = Sniff.where(sniffed: current_user.dogs.first)
    @sent_sniffs = Sniff.where(sniffer: current_user.dogs.first)
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @sniff = Sniff.new
    @sniff.sniffer = current_user.dogs.first
    @sniff.sniffed = @dog
    if @sniff.save
      @chatroom = Chatroom.new(sniff: @sniff)
      @chatroom.save
      redirect_to dog_path(@dog)
    else
      render "dogs/show"
    end
  end

  def update
    @sniff = Sniff.find(params[:id])
    @sniff.status = true
    if @sniff.save
      @chatroom = Chatroom.new(sniff: @sniff)
      redirect_to chatroom_path
    else
      render :index
    end
  end
end
