class ChatroomsController < ApplicationController
  def index
    @chatrooms_as_sniffed = Chatroom.where(sniff: current_user.dogs.first.sniffs_as_sniffed)
    @chatrooms_as_sniffer = Chatroom.where(sniff: current_user.dogs.first.sniffs_as_sniffer)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
