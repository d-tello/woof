class SniffsController < ApplicationController
 def new
  @sniff = Sniff.find(params[:sniff_id])
  @dogs_id = Dogs.new(dogs_params)
  @dogs_id.sniffer_id = @sniffer_id
  @sniffer_id.sniffed_id = @sniffed_id

  if
    sniffer_id == true && sniffed_id == true

    redirect "chatroom/show"
  else
    render "dogs/show"

  end
 end
end
