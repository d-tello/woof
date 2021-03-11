class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(
      sniff: current_user.dogs.first.sniffs_as_sniffed
    ).or(Chatroom.where(
      sniff: current_user.dogs.first.sniffs_as_sniffer)
    )
    @dog = []
    @chatrooms.each do |chatroom|
      if current_user.dogs.include?(chatroom.sniff.sniffed)
        @dog << chatroom.sniff.sniffer
      else
        @dog << chatroom.sniff.sniffed
      end
    end
  end

  def show
    if (Chatroom.find_by_id params[:id]).nil?
      redirect_to chatrooms_path
    else
      @chatroom = Chatroom.find(params[:id])
      @message = Message.new
      if current_user.dogs.include?(@chatroom.sniff.sniffed)
        @dog_to_message = @chatroom.sniff.sniffer
      else
        @dog_to_message = @chatroom.sniff.sniffed
      end
    end
  end
end
