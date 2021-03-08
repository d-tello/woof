class ChatroomsController < ApplicationController
  def index
    if current_user.dogs.blank?
      @chatrooms_as_sniffed = ' '
    else
      @chatrooms_as_sniffed = Chatroom.where(sniff: current_user.dogs.first.sniffs_as_sniffed)
    end

    if current_user.dogs.blank?
      @chatrooms_as_sniffer = ' '
    else
      @chatrooms_as_sniffer = Chatroom.where(sniff: current_user.dogs.first.sniffs_as_sniffer)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    if current_user.dogs.include?(@chatroom.sniff.sniffed)
      @dog_to_message = @chatroom.sniff.sniffer
    else
      @dog_to_message = @chatroom.sniff.sniffed
    end
  end
end
