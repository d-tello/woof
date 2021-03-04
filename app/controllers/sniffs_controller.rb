class SniffsController < ApplicationController

  # def new
  #   @sniff = Sniff.new
  # end

  def create
    @dog = Dog.find(params[:dog_id])
    @sniff = Sniff.new
    @sniff.sniffer = current_user.dogs.first
    @sniff.sniffed = @dog

    if @sniff.save
      @chatroom = Chatroom.new(sniff: @sniff)
      @chatroom.save
           redirect_to dog_path(@dog)

      # redirect_to chatroom_path(@chatroom)
      # notice
    else
         render "dogs/show"
    end
  end
end
