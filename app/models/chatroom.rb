class Chatroom < ApplicationRecord
  belongs_to :sniffs

def new
  @chatroom = Chatroom.new
end


end
